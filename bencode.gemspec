# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bencode/version'

Gem::Specification.new do |spec|
  spec.name          = "bencode"
  spec.version       = BEncode::VERSION
  spec.authors       = ["Daniel Schierbeck"]
  spec.email         = ["daniel.schierbeck@gmail.com"]
  spec.summary       = %q{Encode and decode bencoded data}
  spec.description   = %q{A simple encoder and decoder for the BitTorrent serialization format.}
  spec.homepage      = "http://github.com/dasch/ruby-bencode"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rdoc"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "shoulda"
end
