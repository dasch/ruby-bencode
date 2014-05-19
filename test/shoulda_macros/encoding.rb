
class MiniTest::Test
  def self.it_should_encode(expected, value)
    it "should encode #{value.inspect} into #{expected.inspect}" do
      assert_equal expected, value.bencode
    end
  end
end
