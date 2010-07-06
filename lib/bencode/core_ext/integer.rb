
class Integer
  #
  # Bencodes the Integer object. Bencoded integers are represented
  # as +ixe+, where +x+ is the integer with an optional
  # hyphen prepended, indicating negativity.
  #
  #   42.bencode   #=> "i42e"
  #   -7.bencode   #=> "i-7e"
  def bencode
    "i#{self}e"
  end
end
