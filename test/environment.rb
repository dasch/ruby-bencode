require 'minitest/autorun'
require 'shoulda'

require './lib/bencode'

class MiniTest::Test
  def self.should_decode(expected, encoded, opts = {})
    should "decode #{encoded.inspect} into #{expected.inspect}" do
      assert_equal expected, BEncode.load(encoded, opts)
    end
  end

  def self.should_encode(expected, value)
    should "encode #{value.inspect} into #{expected.inspect}" do
      assert_equal expected, value.bencode
    end
  end
end