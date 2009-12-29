
require 'test/environment'

class DecodingTest < Test::Unit::TestCase
  def test_valid_integer_decoding
    assert_equal 42, BEncode.load("i42e")
  end

  def test_valid_string_decoding
    assert_equal "foo", BEncode.load("3:foo")
  end
end
