
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
