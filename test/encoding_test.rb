# encoding: utf-8
require 'environment'

class EncodingTest < MiniTest::Test
  context "The BEncode encoder" do
    should_encode "i42e", 42
    should_encode "3:foo", "foo"
    should_encode "5:café", "café"
  end
end
