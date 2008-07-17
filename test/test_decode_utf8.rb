
require 'test/unit'
require 'test/environment'

class TestDecodeUTF8 < Test::Unit::TestCase

  def test_can_handle_utf8_encoded_data
    assert_nothing_raised do
      BEncode.load_file('test/fixtures/test.torrent')
    end
  end

end
