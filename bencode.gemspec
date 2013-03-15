Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'bencode'
  s.version           = '0.8.0'
  s.date              = '2013-03-15'

  s.summary = "Encode and decode bencoded data"
  s.description = "A simple encoder and decoder for the BitTorrent serialization format."

  s.authors = ["Daniel Schierbeck"]
  s.email = "daniel.schierbeck@gmail.com"
  s.homepage = "http://github.com/dasch/ruby-bencode"

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.add_development_dependency('rdoc')
  s.add_development_dependency('rake')
  s.add_development_dependency('minitest')
  s.add_development_dependency('shoulda')

  # = MANIFEST =
  s.files = %w[
    Gemfile
    LICENSE
    README.md
    Rakefile
    bencode.gemspec
    lib/bencode.rb
    lib/bencode/core_ext/array.rb
    lib/bencode/core_ext/hash.rb
    lib/bencode/core_ext/integer.rb
    lib/bencode/core_ext/io.rb
    lib/bencode/core_ext/object.rb
    lib/bencode/core_ext/string.rb
    lib/bencode/core_ext/stringio.rb
    lib/bencode/decode.rb
    lib/bencode/parseio.rb
    lib/bencode/parser.rb
    test/benchmark/decoding.rb
    test/benchmark/encoding.rb
    test/bittorrent_test.rb
    test/decoding_test.rb
    test/encoding_test.rb
    test/environment.rb
    test/fixtures/python.torrent
    test/fixtures/test.torrent
    test/shoulda_macros/decoding.rb
    test/shoulda_macros/encoding.rb
    test/utf8_decoding_test.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
