$:.unshift(File.dirname(__FILE__)+"/../../lib")
require 'benchmark'
require 'bencode'

Benchmark.bmbm do |x|
  x.report("Decoding an integer") do
    100_000.times do
      BEncode.load("i42e")
    end
  end

  x.report("Decoding an string") do
    100_000.times do
      BEncode.load("6:foobar")
    end
  end
  x.report("Decoding a long integer array") do
    100.times do
      BEncode.load("l" + ("i42e" * 1000) + "e")
    end
  end
end
