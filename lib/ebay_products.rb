require 'rubygems'
gem 'httparty'
require 'httparty'
require 'activesupport'
require File.dirname(__FILE__) + '/ebay_products/data'

class EbayProducts
  
  include HTTParty
  base_uri "open.api.ebay.com"
  default_params :responseencoding => 'XML', :callname => "FindProducts", :version => "619", :siteid => 0, :maxentries => 18
  
  attr_reader :query, :appid, :product_id
  
  def initialize(args, appid)
    @query = args[:keywords]
    @product_id = args[:product_id]
    @appid = appid
  end
  
  def search
    if @search.blank?
      response = self.class.get("/shopping", :query => options, :format => :xml)["FindProductsResponse"]
      errors = response['Errors']
      if errors
        raise SearchFailure, errors['LongMessage']
      end
      @search = response["Product"]
      if @search.is_a? Hash
        @search = [@search]
      end
    end
    @search
  end
  
  def products
    @products ||= search.collect {|product| ProductInformation.new(product) }
  end

  def product
    products.first
  end

  def options
    hash = {:appid => @appid}
    if @product_id
      hash['ProductID.value'.to_sym] = @product_id
      hash['ProductID.type'.to_sym] = 'Reference' # assumes product id is of type reference
    else
      hash[:QueryKeywords] = @query
    end
    hash
  end
end

class SearchFailure < RuntimeError; end
