# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdpresent/version'

Gem::Specification.new do |spec|
  spec.name          = "mdpresent"
  spec.version       = Mdpresent::VERSION
  spec.authors       = ["Ankit Goyal"]
  spec.email         = ["ankit3goyal@gmail.com"]
  spec.description   = %q{publish quick presentations from markdown files}
  spec.summary       = %q{wrapper over mdpress to publish quick markdown files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "thor"
  spec.add_dependency "i18n"
  spec.add_development_dependency "pry"
end
