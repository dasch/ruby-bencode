# encoding: utf-8
require 'environment'

describe "encoding" do
  it_should_encode "i42e", 42
  it_should_encode "3:foo", "foo"
  it_should_encode "5:café", "café"
end
