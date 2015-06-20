require "spec_helper"
require "link"

describe Link do
    context " - by default a new link : " do
      subject(:link){ Link.new }

      it { should respond_to(:title)}
      it { should respond_to(:url)}
      it { should respond_to(:description)}
      it { should respond_to(:valid_url?)}
      it { pending
      		should respond_to(:toJSON)}

    end


    context "- #valid_url?" do
    	subject(:link) { Link.new(description: "valid_url_testing link", title: "Testing purpose Link")}
    	# TODO : do not call original, do stub it completly
    	before { 
        link.should_receive(:valid_url?).at_least(1).times.and_call_original
        Link.should_receive(:get_request_head_infos).at_least(1).times.and_call_original
      } 
    	context "-- valid https url, no redirection, should return true" do 
    		it { 
    			link.url="https://twitter.com/"
    			should be_valid_url
    		}
    	end		 
    			 
	    it "-- and given a valid http url, should return true"  do
  	    link.url=  "http://links.e-jambon.com"
  	    link.url.should eq("http://links.e-jambon.com")
  			link.should be_valid_url 
		  end

	    it "-- and Given an valid https url, with redirections, should return true" do
  			link.url= "https://www.google.com"
  			link.url.should eq("https://www.google.com")       
  			link.should be_valid_url
	    end

	    it "-- when given an invalid url, should return false"  do
        link.url=  "http://tis@not+=validate.thelan"
        link.should_not be_valid_url
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