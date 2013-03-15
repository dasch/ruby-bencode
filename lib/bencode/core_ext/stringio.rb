require 'stringio'
require 'bencode/parseio'

class StringIO
  include BEncode::ParseIO
end
