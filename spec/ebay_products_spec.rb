require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "EbayProducts" do
    
  context "Initializing" do

    it "should raise an error without a query and appid" do
      lambda {EbayProducts.new}.should raise_error
      lambda {EbayProducts.new({:keywords => "query"})}.should raise_error
    end

    it "save the query and appid" do
      ebay = EbayProducts.new({:keywords => "query"}, "1234")
      ebay.query.should == "query"
      ebay.appid.should == "1234"
    end

  end
  
  context "Finding" do
    
    before(:each) do
      FakeWeb.register_uri(:get, "http://open.api.ebay.com:80/shopping?QueryKeywords=harry%20potter&callname=FindProducts&siteid=0&maxentries=18&appid=123abc&version=619&responseencoding=XML", :body => File.read("#{File.dirname(__FILE__)}/samples/harry_potter.xml"))
      @ebay = EbayProducts.new({:keywords => "harry potter"}, "123abc")
    end

    it "search should return an Array" do
      @ebay.search.should be_an_instance_of(Array)
    end

    it "ebay products should not wipe out search results" do
      product = @ebay.search.first
      proc { @ebay.products }.should_not change(product, :size)
    end

    it "should find the products" do
      @ebay.products.size.should == 2
    end
    
    context "Search failure" do
      before(:each) do
        FakeWeb.register_uri(:get, "http://open.api.ebay.com:80/shopping?QueryKeywords=xbox&callname=FindProducts&siteid=0&maxentries=18&appid=123abc&version=619&responseencoding=XML", :body => File.read("#{File.dirname(__FILE__)}/samples/failure.xml"))
        @ebay = EbayProducts.new({:keywords => "xbox"}, "123abc")
      end
      
      it "should throw search failure" do
        lambda { @ebay.search }.should raise_error(SearchFailure)
      end

    end
  end
  
end
