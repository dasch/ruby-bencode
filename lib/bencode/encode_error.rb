
unless BEncode.const_defined? :EncodeError
  BEncode::EncodeError = Class.new(StandardError)
end
