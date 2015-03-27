lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'friendly_key/version'

Gem::Specification.new do |spec|
  spec.name          = "friendly_key"
  spec.version       = FriendlyKey::VERSION
  spec.authors       = ["tyamagu2"]
  spec.email         = ["tyamagu2@gmail.com"]
  spec.summary       = %q{Human friendly random key generator}
  spec.description   = %q{FriendlyKey lets you generate human friendly random strings. It generates random alphanumeric strings without letters and digits that are hard to distinguish from each other, such as I, l and 1.
You can use FriendlyKey when you need random strings that you don't want your users to copy and paste but rather enter by themselves, like  product keys and random passwords.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
