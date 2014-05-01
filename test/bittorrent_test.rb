require 'environment'

class BitTorrentTest < MiniTest::Test
  should "load a bencoded torrent file" do
    BEncode.load_file("test/fixtures/python.torrent")
    pass
  end
end
