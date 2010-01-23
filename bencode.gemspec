Gem::Specification.new do |s|
  s.name = "bencode"
  s.version = "0.5.1"
  s.summary = "Ruby bencode bindings"
  s.email = "daniel.schierbeck@gmail.com"
  s.homepage = "http://github.com/dasch/ruby-bencode-bindings"
  s.description = "Ruby bindings for the bencode data serialization format."
  s.has_rdoc = true
  s.authors = ["Daniel Schierbeck"]
  s.files = ['Rakefile', 'LICENSE', 'README.md', 'lib/bencode.rb', 'lib/bencode/decode.rb', 'lib/bencode/decode_error.rb', 'lib/bencode/encode_error.rb', 'lib/bencode/io.rb', 'lib/bencode/encode/array.rb', 'lib/bencode/encode/integer.rb', 'lib/bencode/encode/string.rb', 'lib/bencode/encode/hash.rb', 'lib/bencode/encode/object.rb']
  s.test_files = ['test/utf8_decoding_test.rb', 'test/environment.rb', 'test/fixtures/test.torrent']
end
