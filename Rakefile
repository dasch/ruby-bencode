
require 'rubygems'
require 'rake'
require 'hoe'
require 'rcov/rcovtask'
require 'rake/rdoctask'

require './lib/bencode'

unless File.exist? 'Manifest.txt'
  File.open('Manifest.txt', 'w'){|file| file.print '' }
end

Hoe.new('bencode', BEncode::VERSION) do |p|
  p.author = 'Daniel Schierbeck'
  p.summary = 'A Ruby implementation of the bencode encoding, ' +
              'used by the BitTorrent protocol'
end

Rcov::RcovTask.new(:coverage) do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/test_*.rb']
  t.verbose = false
end

task :clean => [:clobber_coverage]

task :default => [:manifest]

desc 'Create the manifest file for this project'
task :manifest do
  patterns = %w[Rakefile Manifest.txt README.txt lib/**/*.rb test/**/*.rb]
  filenames = FileList[patterns]

  # add files to the manifest
  puts 'Adding filenames to manifest:'
  File.open('Manifest.txt', 'w') do |file|
    filenames.each do |f|
      puts '- ' + f
      file.puts(f)
    end
  end

  puts "\nAdded #{filenames.size} filenames to manifest"
end

task :benchmark do
  FileList['bench/**/bm_*.rb'].each do |bm|
    require bm
  end
end

desc "Create tags for Vim"
task :tags do
  sh 'rtags --vi -R lib/*.rb'
end
