
require 'strscan'

module BEncode
  class << self
    # BEncodes +obj+
    def dump(obj)
      obj.bencode
    end

    # Bdecodes +str+
    def load(str)
      scanner = StringScanner.new(str)
      obj = parse(scanner)
      raise BEncode::DecodeError unless scanner.eos?
      return obj
    end

    # Bdecodes the file located at +path+
    def load_file(path)
      load(File.open(path, 'rb') {|f| f.read})
    end

    def parse(scanner) # :nodoc:
      case scanner.peek(1)[0]
      when ?i
        scanner.pos += 1
        num = scanner.scan_until(/e/) or raise BEncode::DecodeError
        return Integer(num.chop)
      when ?l
        scanner.pos += 1
        ary = []
        ary.push(parse(scanner)) until scanner.scan(/e/)
        return ary
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
        return hsh
      when ?0 .. ?9
        num = scanner.scan_until(/:/) or
           raise BEncode::DecodeError, "invalid string length (no colon)"

        begin
          length = Integer(num.chop)
          str = scanner.peek(length)
          scanner.pos += length
        rescue
          raise BEncode::DecodeError, "invalid string length"
        end

        return str
      else
        raise BEncode::DecodeError, "Invalid specifier #{scanner.peek(1).inspect} at position #{scanner.pos+1}"
      end
    end

    private :parse
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
