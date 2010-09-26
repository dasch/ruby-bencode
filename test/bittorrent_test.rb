
require 'test/environment'


class BitTorrentTest < MiniTest::Unit::TestCase
  should "load a bencoded torrent file" do
    BEncode.load_file("test/fixtures/python.torrent")
    pass
  end
end
