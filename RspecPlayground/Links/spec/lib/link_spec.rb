require "spec_helper"
require "link"

describe Link do
    context "Link " do
      subject(:link){ Link.new }

      it { link.should respond_to(:title)}
      it { link.should respond_to(:url)}
      it { link.should respond_to(:description)}
      it { link.should respond_to(:is_url_valid?)}
      it { link.should respond_to(:toJSON)}
    end

    context "given a valid http url" do
        subject(:link) { Link.new(  {url: "http://links.e-jambon.com" }) }
          it { link.url.should eq("http://links.e-jambon.com")}
          it { link.should be_is_url_valid }
     end

    context "given an invalid url" do
          subject(:link) { Link.new( {url: "http://tis@not+=validate.thelan" }) }
        
          it { link.should_not be_is_url_valid }
     end

    context "given an valid https url, with a redirection" do
         subject(:link) { Link.new( {url: "https://www.google.com" }) }        
         it { link.should be_is_url_valid() }
    end

      
end



describe "A new Link"   do
    subject(:link){ Link.new }

    it "has a  'New link' title, an empty url, and an 'Empty description' description" do 
      link = Link.new()
      link.title.should eq("New Link")
      link.url.should eq("")
      link.description.should eq("Empty description")
    end
end