require 'stringio'
require 'bencode/parseio'

module BEncode
  class Parser
    attr_reader :stream

    def initialize(stream)
      if stream.kind_of? BEncode::ParseIO
        @stream = stream
      elsif stream.respond_to? :string
        @stream = StringIO.new stream.string
      elsif stream.respond_to? :to_s
        @stream = StringIO.new stream.to_s
      end
    end

    def parse!
      case stream.peek
        when ?i then parse_integer!
        when ?l then parse_list!
        when ?d then parse_dict!
        when ?0 .. ?9 then parse_string!
      end
    end
    
    def eos?
      stream.eof?
    end

    private

    def parse_integer!
      stream.getc
      num = stream.gets("e") or raise BEncode::DecodeError
      num.chop.to_i
    end

    def parse_list!
      stream.getc
      ary = []
      ary.push(parse!) until stream.peek == ?e
      stream.getc
      ary
    end

    def parse_dict!
      stream.getc
      hsh = {}
      until stream.peek == ?e
        key = parse!

        unless key.is_a? String or key.is_a? Fixnum
          raise BEncode::DecodeError, "key must be a string or number"
        end
          
        val = parse!

        hsh.store(key.to_s, val)
      end
      stream.getc
      hsh
    end

    def parse_string!
      num = stream.gets(":") or
        raise BEncode::DecodeError, "invalid string length (no colon)"

      begin
        length = num.chop.to_i
        return "" if length == 0 # Workaround for Rubinius bug
        str = stream.read(length)
      rescue
        raise BEncode::DecodeError, "invalid string length"
      end

      str
    end
  end
end
