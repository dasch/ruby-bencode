
class MiniTest::Unit::TestCase
  def self.should_encode(expected, value)
    should "encode #{value.inspect} into #{expected.inspect}" do
      assert_equal expected, value.bencode
    end
  end
end
