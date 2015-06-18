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
	 	uri = URI.parse(url_entry)
	 	req1 = Net::HTTP.new(uri.host, uri.port)
	 	req1.use_ssl = (uri.scheme == 'https')
	 	path = uri.path unless uri.path.empty?
	 	path = path || '/'
	 	res = req1.request_head(path)
	 	infos[:code]  = res.code
	 	infos[:is_url_redirection] = res.kind_of?Net::HTTPRedirection
	 	infos[:redirection_url	] = res['location'] || url_entry
		return infos
	end


	 def is_url_valid?(option ={})
	 	begin
	 		option = {url_entry: @url, is_callback: false }.merge(option)
		 	infos = Hash.new
		 	infos = get_request_head_infos(option[:url_entry])
	 		is_redirection = option[:is_callback] || infos[:is_url_redirection]
	 		if (is_redirection && infos[:is_url_redirection])   
	 				is_url_valid?({url_entry: infos[:redirection_url], is_callback: true})
	 		else
	 				return ! %W(4 5).include?(infos[:code][0]) # Not from 4xx or 5xx families, should therefore return true
	 		end
	 	rescue # All errors are catched here. Those will return false. We do not need to know more thus far, link is not valid.
	 	  false #false if can't find the server
	 	end
	 end
end