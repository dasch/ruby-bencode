Gem::Specification.new do |s|
  s.name = "bencode"
  s.version = "0.5.0"
  s.summary = "Ruby bencode bindings"
  s.email = "daniel.schierbeck@gmail.com"
  s.homepage = "http://github.com/dasch/ruby-bencode-bindings"
  s.description = "Ruby bindings for the bencode data serialization format."
  s.has_rdoc = true
  s.authors = ["Daniel Schierbeck"]
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
end
