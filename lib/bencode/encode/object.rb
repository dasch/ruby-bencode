
class Object
  #
  # Raises an exception. Subclasses of Object must themselves
  # define meaningful #bencode methods.
  def bencode
    raise BEncode::EncodeError, "cannot bencode #{self.class}"
  end
end
