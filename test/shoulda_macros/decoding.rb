
class MiniTest::Test
  def self.it_should_decode(expected, encoded, opts = {})
    it "should decode #{encoded.inspect} into #{expected.inspect}" do
      assert_equal expected, BEncode.load(encoded, opts)
    end
  end
end
