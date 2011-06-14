
require 'test/environment'

class DecodingTest < MiniTest::Unit::TestCase
  context "The BEncode decoder" do
    should_decode 42, "i42e"
    should_decode 0, "i0e"
    should_decode -42, "i-42e"

    should_decode "foo", "3:foo"
    should_decode "", "0:"

    should_decode [1, 2, 3], "li1ei2ei3ee"
    
    should_decode 42, "i42eBOGUS", :ignore_trailing_junk => true
  end
end
