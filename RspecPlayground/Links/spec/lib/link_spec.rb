require "spec_helper"
require "link"

describe Link do
    context "Link " do
      subject(:link){ Link.new }

      it { link.should respond_to(:title)}
      it { link.should respond_to(:url)}
      it { link.should respond_to(:description)}
      it { link.should respond_to(:valid_url?)}
      it { link.should respond_to(:toJSON)}

    end

    context "#valid_url" do
    	subject(:link) { Link.new(description: "valid_url_testing link", title: "Testing purpose Link")}

	    context "given a valid http url", http: true do
	        before { link.url=  "http://links.e-jambon.com" } 
	          its(:url) { should eq("http://links.e-jambon.com")}
	          it { link.should be_valid_url }
	     end

	    context "given an invalid url", http: true do
	          subject(:link) { Link.new({url: "http://tis@not+=validate.thelan" } ) }
	        
	          it { link.should_not be_valid_url }
	     end

		# assuming google.com redirects to your local country version (google.fr for me) 
		# One might need to change this example for it to work as intended
		# stup & mocks to the rescue, please.
	    context "given an valid https url, with a redirection", http: true do
	         subject(:link) { Link.new( {url: "https://www.google.com" }) } 
	         its(:url) {should eq("https://www.google.com")}       
	         it { link.should be_valid_url() }
	    end
	end

      
end



describe "A new Link"   do
    subject(:link){ Link.new }

    context ",by default, has a  'New link' title, an empty url, and an 'Empty description' description" do 
      its(:title) {should eq("New Link")}
      its(:url) { should eq("") }
      its(:description) {should eq("Empty description")}
    end
end