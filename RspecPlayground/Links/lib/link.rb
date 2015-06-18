require 'net/http'


class Link
	attr_accessor  :url, :description, :title
	

	def initialize (options = {})
	    @title = options[:title] || "New Link"
	    @description= options[:description] || "Empty description"
	    @url =  options[:url] || "" 
	end


	# Request the header and grab infos in a hash :
	# :code = HHTP response status code
	# :is_url_rediredtion true/false, tells us if the url is redirected.
	# :redirection_url either the url_entry, in case there is no redirection, 
	#  		or the url to wich the original site is pointing to.
	#       This way, in the end, we get out with a valid url to test.
	def get_request_head_infos(url_entry)
		infos = Hash.new
		puts "IN --> get_request_head_infos"	
		puts " url_entry : #{url_entry}"
	 	uri = URI.parse(url_entry)
	 	req1 = Net::HTTP.new(uri.host, uri.port)
	 	req1.use_ssl = (uri.scheme == 'https')
	 	path = uri.path unless uri.path.empty?
	 	path = path || '/'
	 	res = req1.request_head(path)
	 	infos[:code]  = res.code
	 	infos[:is_url_redirection] = res.kind_of?Net::HTTPRedirection
	 	infos[:redirection_url	] = res['location'] || url_entry
	 	puts "OUTPUT :"
	 	p infos 
	 	puts " get_request_head_infos >>>> OUT "
		return infos
	end


	 def is_url_valid?(option ={})
	 	begin
	 		puts "IN --> is_url_valid?"
	 		option = {url_entry: @url, is_callback: false }.merge(option)
	 		puts "URL =  #{option[:url_entry]} "
		 	puts "is_callback = #{option[:is_callback]}"
		 	infos = Hash.new
		 	infos = get_request_head_infos(option[:url_entry])
	 		puts "infos[:is_url_redirection]: #{infos[:is_url_redirection]}"
	 		is_redirection = option[:is_callback] || infos[:is_url_redirection]
	 		puts " = is_redirection: #{is_redirection}"
	 		if (is_redirection && infos[:is_url_redirection])   
	 			puts "This is a redirection. url_entry : #{option[:url_entry]} "
	 			puts " and url destination = #{infos[:redirection_url]}"
	 			puts "Let's try to validate the redirection, because it could turn being redirected too"
	 				is_url_valid?({url_entry: infos[:redirection_url], is_callback: true})
	 		else
	 				puts "we must get the full url and test it"
	 				puts "is URL valid ? Let's see what the result code looks like"
	 				return ! %W(4 5).include?(infos[:code][0]) # Not from 4xx or 5xx families, should therefore return true
	 		end
	 	rescue # All errors are catched here. Those will return false. We do not need to know more thus far, link is not valid.
	 		puts "@@@ ERROR @@@ --> false"

	 	  false #false if can't find the server
	 	end
	 end
end