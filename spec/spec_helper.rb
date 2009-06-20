require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ebay_products'
require 'fakeweb'
FakeWeb.allow_net_connect = false

Spec::Runner.configure do |config|
  
end
