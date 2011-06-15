
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
    scanner = StringScanner.new(str)
    obj = parse(scanner)
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

  private

  def self.parse(scanner) # :nodoc:
    val = case scanner.peek(1)[0]
          when ?i
            scanner.pos += 1
            num = scanner.scan_until(/e/) or raise BEncode::DecodeError
            num.chop.to_i
          when ?l
            scanner.pos += 1
            ary = []
            ary.push(parse(scanner)) until scanner.scan(/e/)
            ary
          when ?d
            scanner.pos += 1
            hsh = {}
            until scanner.scan(/e/)
              key = parse(scanner)

              unless key.is_a? String or key.is_a? Fixnum
                raise BEncode::DecodeError, "key must be a string or number"
              end

              hsh.store(key.to_s, parse(scanner))
            end
            hsh
          when ?0 .. ?9
            num = scanner.scan_until(/:/) or
              raise BEncode::DecodeError, "invalid string length (no colon)"

            begin
              length = num.chop.to_i
              str = scanner.peek(length)
              scanner.pos += num.chop.to_i
            rescue
              raise BEncode::DecodeError, "invalid string length"
            end

            str
          end

    raise BEncode::DecodeError if val.nil?
    val
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
