$:.unshift(File.dirname(__FILE__)+"/../../lib")
require 'benchmark'
require 'bencode'

Benchmark.bmbm do |x|
  x.report("Encoding an array of integers") do
    100.times do
      ((1..50).to_a * 100).bencode
    end
  end
end
