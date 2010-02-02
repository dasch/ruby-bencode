
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
    "#{length}:#{self}"
  end
end
