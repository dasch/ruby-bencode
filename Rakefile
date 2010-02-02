
require 'rake/testtask'
require 'rake/rdoctask'

task :default => :test

desc "Run all unit tests"
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end


desc "Generate RDoc documentation"
Rake::RDocTask.new :doc do |rdoc|
  rdoc.rdoc_dir = 'doc'
end

desc "Run all the benchmarks"
task :benchmark do
  Dir["test/benchmark/*.rb"].each do |file|
    puts ">> Running #{file}"
    puts %x[ruby #{file}]
    puts
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "bencode"
    gem.summary = "Encode and decode bencoded data"
    gem.description = "A simple encoder and decoder for the BitTorrent serialization format."
    gem.email = "daniel.schierbeck@gmail.com"
    gem.homepage = "http://github.com/dasch/ruby-bencode"
    gem.authors = ["Daniel Schierbeck"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
