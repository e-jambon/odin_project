def echo msg
	msg
end

def shout msg
	msg.upcase
end

def repeat (msg , n=2) 
	out =""
	(n-1).times{ out += " " + msg }  
	msg + out
end

def start_of_word word,n
	out = ""
	0.upto(n-1) {|i| out += word[i]}
	out
end

def first_word msg
	msg.split(" ")[0]
end

def titleize msg
	notcap=%w(and the a in of an over)
	out =msg.gsub(/\w+/) {|word| (notcap.include?(word)) ? word : word.capitalize }
	out[0] = out[0].upcase 
	out
end
