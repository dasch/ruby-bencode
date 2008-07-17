
# TODO: Write some documentation here.
module BEncode
  VERSION = '0.5.0'
end

glob = File.join(File.dirname(__FILE__), 'bencode/**/*.rb')

Dir[glob].sort.each{|file| require file }
