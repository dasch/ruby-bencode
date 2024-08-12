
# Support for loading and dumping bencoded data.
#
# See {BEncode.load} and {BEncode.dump}.
module BEncode
  VERSION = "1.0.0"

  class DecodeError < StandardError
  end

  class EncodeError < StandardError
  end
end

glob = File.join(File.dirname(__FILE__), 'bencode/**/*.rb')

Dir[glob].sort.each {|file| require file }
