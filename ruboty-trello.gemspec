lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/trello/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-trello'
  spec.version       = Ruboty::Trello::VERSION
  spec.authors       = ['Masahiro Ihara']
  spec.email         = ['ihara@bitjourney.com', 'dex1t@degoo.org']

  spec.summary       = %q{Ruboty plugin for adding a new card to Trello}
  spec.description   = %q{Ruboty plugin for adding a new card to Trello}
  spec.homepage      = 'http://github.com/bitjourney/ruboty-trello'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'ruboty'
  spec.add_dependency 'ruby-trello'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 11.0'
end
