module BEncode
  class Parser
    attr_reader :scanner

    def initialize(scanner)
      @scanner = scanner
    end

    def self.parse(scanner)
      new(scanner).parse!
    end

    def parse!
      val = \
      case scanner.peek(1)[0]
      when ?i
        scanner.pos += 1
        num = scanner.scan_until(/e/) or raise BEncode::DecodeError
        num.chop.to_i
      when ?l
        scanner.pos += 1
        ary = []
        ary.push(parse!) until scanner.scan(/e/)
        ary
      when ?d
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
end
