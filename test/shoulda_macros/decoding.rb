
class MiniTest::Unit::TestCase
  def self.should_decode(expected, encoded, opts = {})
    should "decode #{encoded.inspect} into #{expected.inspect}" do
      assert_equal expected, BEncode.load(encoded, opts)
    end
  end
end
