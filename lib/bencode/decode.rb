
module BEncode
  class << self
    # BEncodes +obj+
    def dump(obj)
      obj.bencode
    end

    # Bdecodes +str+
    def load(str)
      require 'strscan'

      scanner = StringScanner.new(str)
      obj = parse(scanner)
      raise BEncode::DecodeError unless scanner.eos?
      return obj
    end

    # Bdecodes the file located at +path+
    def load_file(path)
      if RUBY_PLATFORM =~ /(win|w)32$/
        load(File.open(path, 'rb').read)
      else
        load(File.open(path).read)
      end
    end

    def parse(scanner) # :nodoc:
      case scanner.scan(/[ild]|\d+:/)
      when "i"
        number = scanner.scan(/0|(?:-?[1-9][0-9]*)/)
        raise BEncode::DecodeError unless number and scanner.scan(/e/)
        return number.to_i
      when "l"
        ary = []
        # TODO: There must be a smarter way of doing this...
        ary.push(parse(scanner)) until scanner.peek(1) == "e"
        scanner.pos += 1
        return ary
      when "d"
        hsh = {}
        until scanner.peek(1) == "e"
          key, value = parse(scanner), parse(scanner)

          unless key.is_a? String
            raise BEncode::DecodeError, "key must be a string"
          end

          hsh.store(key, value)
        end
        scanner.pos += 1
        return hsh
      when /\d+:/
        length = Integer($~.string.chop)
        str = scanner.peek(length)

        begin
          scanner.pos += length
        rescue RangeError
          raise BEncode::DecodeError, "invalid string length"
        end

        return str
      else
        raise BEncode::DecodeError
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
