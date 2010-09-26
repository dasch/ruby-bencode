
class MiniTest::Unit::TestCase
  def self.should_decode(expected, encoded)
    should "decode #{encoded.inspect} into #{expected.inspect}" do
      assert_equal expected, BEncode.load(encoded)
    end
  end
end
