
require 'rubygems'
require 'bundler/setup'

Bundler.require(:test)

require 'test/unit'
require 'shoulda'
require File.dirname(__FILE__) + '/../lib/bencode'
Dir.glob(File.dirname(__FILE__) + '/shoulda_macros/*.rb').each do |macro|
  require macro
end
