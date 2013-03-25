# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'audio_stuffs/version'

Gem::Specification.new do |gem|
  gem.name          = "audio_stuffs"
  gem.version       = AudioStuffs::VERSION
  gem.authors       = ["TJ Taylor"]
  gem.email         = ["Thomas_Taylor2@cable.comcast.com"]
  gem.description   = %q{Audio Stuffs for Phil}
  gem.summary       = %q{Scripts for managing Phil's audio collection}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'taglib-ruby'
  gem.add_dependency 'activerecord'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'
end
