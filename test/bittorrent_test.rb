
require 'test/environment'


class BitTorrentTest < Test::Unit::TestCase
  should "load a bencoded torrent file" do
    assert_nothing_raised do
      BEncode.load_file("test/fixtures/python.torrent")
    end
  end
end
