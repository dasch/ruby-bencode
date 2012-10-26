module BEncode
  class Parser
    attr_reader :scanner

    def initialize(scanner)
      @scanner = scanner
    end

    def self.parse(scanner)
      val = new(scanner).parse!

      raise BEncode::DecodeError if val.nil?

      return val
    end

    def parse!
      case scanner.peek(1)[0]
      when ?i
        parse_integer!
      when ?l
        parse_list!
      when ?d
        parse_dict!
      when ?0 .. ?9
        parse_string!
      end
    end

    private

    def parse_integer!
      scanner.pos += 1
      num = scanner.scan_until(/e/) or raise BEncode::DecodeError
      num.chop.to_i
    end

    def parse_list!
      scanner.pos += 1
      ary = []
      ary.push(parse!) until scanner.scan(/e/)
      ary
    end

    def parse_dict!
      scanner.pos += 1
      hsh = {}
      until scanner.scan(/e/)
        key = parse!

        unless key.is_a? String or key.is_a? Fixnum
          raise BEncode::DecodeError, "key must be a string or number"
        end

        hsh.store(key.to_s, parse!)
      end
      hsh
    end

    def parse_string!
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
  end
end
