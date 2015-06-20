require 'net/http'
require 'pry'

class Link
	attr_accessor  :url, :description, :title
	

	def initialize (options = {})
		options = {title: "New Link", description: "Empty description", url: ""}.merge(options)
	    @title = options[:title]
	    @description= options[:description]
	    @url =  options[:url]
	end


	# Request the header and grab infos in a hash :
	# :code = HHTP response status code
	# :is_url_rediredtion true/false, tells us if the url is redirected.
	# :redirection_url either the url_entry, in case there is no redirection, 
	#  		or the url to wich the original site is pointing to.
	#       This way, in the end, we get out with a valid url to test.
	def self.get_request_head_infos(url_entry)
		infos = Hash.new
	 	uri = URI.parse(url_entry)
	 	request = Net::HTTP.new(uri.host, uri.port)
	 	request.use_ssl = (uri.scheme == 'https')
	 	path = (uri.path unless uri.path.empty? ) || '/'
	 	response = request.request_head(path)
	 	infos= { code: response.code, 
	 			is_url_redirection: (response.kind_of?Net::HTTPRedirection) , 
	 			redirection_url: (response['location'] || url_entry) 
	 		}
		return infos
	end


	 def valid_url?(options ={})
	 	begin
	 		options = {url_entry: @url, is_callback: false }.merge(options)
		 	infos = Hash.new
		 	infos = self.class.get_request_head_infos(options[:url_entry])
	 		is_redirection = options[:is_callback] || infos[:is_url_redirection]
	 		if (is_redirection && infos[:is_url_redirection])   
	 				valid_url?({url_entry: infos[:redirection_url], is_callback: true})
	 		else
	 				return ! %W(4 5).include?(infos[:code][0]) # Not from 4xx or 5xx families, should therefore return true
	 		end
	 	rescue # All errors are catched here. Those will return false. We do not need to know more thus far, link is not valid.
	 	  false #false if can't find the server
	 	end
	 end
end
