require 'environment'

describe "bittorrent" do
  it "should load a bencoded torrent file" do
    BEncode.load_file("test/fixtures/python.torrent")
    pass
  end
end
