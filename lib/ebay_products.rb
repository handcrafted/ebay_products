require 'rubygems'
gem 'httparty'
require 'httparty'
require 'activesupport'
require File.dirname(__FILE__) + '/ebay_products/data'

class EbayProducts
  
  include HTTParty
  base_uri "open.api.ebay.com"
  default_params :responseencoding => 'XML', :callname => "FindProducts", :version => "619", :siteid => 0, :maxentries => 18
  
  attr_reader :query, :appid
  
  def initialize(query, appid)
    @query, @appid = query, appid
  end
  
  def search
    @search ||= self.class.get("/shopping", :query => {:QueryKeywords => @query, :appid => @appid})["FindProductsResponse"]["Product"]
  end
  
  def products
    @products ||= search.collect {|product| ProductInformation.new(product) }
  end
  
end