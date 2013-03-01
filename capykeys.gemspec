# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capykeys/version'

Gem::Specification.new do |gem|
  gem.name          = "capykeys"
  gem.version       = Capykeys::VERSION
  gem.authors       = %w(Dakuan)
  gem.email         = %w(dom.barker808@gmail.com)
  gem.description   = %q{This gem makes it nice and easy to simulate common user kepress events like typing words, paragraphs or deleting text}
  gem.summary       = %q{Wraps keypress events}
  gem.homepage      = "https://github.com/Dakuan/capykeys"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
