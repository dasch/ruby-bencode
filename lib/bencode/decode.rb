
require 'strscan'

module BEncode
  # Encodes the Ruby object +obj+ into a bencoded string.
  #
  # @param [Hash, Array, Integer, String] obj the object to encode
  # @return [String] a bencoded string
  # @raise [EncodeError] if +obj+ is not a supported object type
  def self.dump(obj)
    obj.bencode
  end

  # Decodes +str+ into a Ruby structure.
  #
  # @param [String] str a bencoded string
  # @option opts [Boolean] :ignore_trailing_junk (false) whether
  #  to ignore invalid bencode at the end of +str+
  # @return [Object] a Ruby object
  # @raise [DecodeError] if +str+ is malformed
  def self.load(str, opts = {})
    scanner = BEncode::Parser.new(str)
    obj = scanner.parse!
    raise BEncode::DecodeError unless (opts[:ignore_trailing_junk] || scanner.eos?)
    return obj
  end

  # Decodes the file located at +path+.
  #
  # @param [String] path path to the bencoded file
  # @option (see .load)
  # @return (see .load)
  def self.load_file(path, opts = {})
    load(File.open(path, 'rb').read, opts)
  end
end

class String
  #
  # Bdecodes the String object and returns the data serialized
  # through bencoding.
  #
  #   "li1ei2ei3ee".bdecode   #=> [1, 2, 3]
  #
  def bdecode
    BEncode.load(self)
  end
end
