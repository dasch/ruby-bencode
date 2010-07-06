
# TODO: Write some documentation here.
module BEncode
  class DecodeError < StandardError
  end

  class EncodeError < StandardError
  end

end

glob = File.join(File.dirname(__FILE__), 'bencode/**/*.rb')

Dir[glob].sort.each{|file| require file }
