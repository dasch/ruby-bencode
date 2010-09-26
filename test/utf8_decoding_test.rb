
require 'test/environment'

class UTF8DecodingTest < MiniTest::Unit::TestCase
  context "The BEncode decoder" do
    should "be able to handle UTF8-encoded data" do
      BEncode.load_file('test/fixtures/test.torrent')
      pass
    end
  end
end
