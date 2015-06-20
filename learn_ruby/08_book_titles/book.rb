class Book 
 attr_accessor	:title

 	def title= title
 		@title = titleize title
 	end

 	def titleize msg
		notcap=%w(and the a in of an over)
		out =msg.gsub(/\w+/) {|word| (notcap.include?(word)) ? word : word.capitalize }
		out[0] = out[0].upcase 
		out
	end
 

end
