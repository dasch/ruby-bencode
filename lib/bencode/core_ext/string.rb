
class String
  #
  # Bencodes the String object. Bencoded strings are represented
  # as <code>x</code>:<code>y</code>, where +y+ is the string and +x+
  # is the length of the string.
  #
  #   "foo".bencode   #=> "3:foo"
  #   "".bencode      #=> "0:"
  #
  def bencode
    "#{bytesize}:#{self}"
  end

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
