require 'rubygems'
require 'bundler/setup'

require 'minitest/unit'
require 'shoulda'

MiniTest::Unit.autorun

require File.dirname(__FILE__) + '/../lib/bencode'
Dir.glob(File.dirname(__FILE__) + '/shoulda_macros/*.rb').each do |macro|
  require macro
end
