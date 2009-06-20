require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "EbayProducts" do
    
  context "Initializing" do
    
    it "should raise an error without a query and appid" do
      lambda {EbayProducts.new}.should raise_error
      lambda {EbayProducts.new("query")}.should raise_error
    end
    
    it "save the query and appid" do
      ebay = EbayProducts.new("query", "1234")
      ebay.query.should == "query"
      ebay.appid.should == "1234"
    end
    
  end
  
  context "Finding" do
    
    before(:each) do
      FakeWeb.register_uri(:get, "http://open.api.ebay.com:80/shopping?QueryKeywords=harry%20potter&callname=FindProducts&siteid=0&maxentries=18&appid=123abc&version=619&responseencoding=XML", :string => File.read("#{File.dirname(__FILE__)}/samples/harry_potter.xml"))
    end
    
    it "should find the products" do
      e = EbayProducts.new("harry potter", "123abc")
      puts e.products
    end
    
  end
  
end
