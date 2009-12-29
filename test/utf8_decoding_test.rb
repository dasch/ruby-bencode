
require 'test/environment'

class UTF8DecodingTest < Test::Unit::TestCase
  context "The BEncode decoder" do
    should "be able to handle UTF8-encoded data" do
      assert_nothing_raised do
        BEncode.load_file('test/fixtures/test.torrent')
      end
    end
  end
end
