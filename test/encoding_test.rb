
require 'test/environment'

class EncodingTest < MiniTest::Unit::TestCase
  context "The BEncode encoder" do
    should_encode "i42e", 42
    should_encode "3:foo", "foo"
  end
end
