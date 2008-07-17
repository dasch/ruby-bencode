
unless BEncode.const_defined? :DecodeError
  BEncode::DecodeError = Class.new(StandardError)
end
