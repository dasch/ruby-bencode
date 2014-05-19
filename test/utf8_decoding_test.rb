require 'environment'

describe "utf encoding" do
  it "should be able to handle UTF8-encoded data" do
    BEncode.load_file('test/fixtures/test.torrent')
    pass
  end
end
