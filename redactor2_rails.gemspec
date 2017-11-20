
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redactor2_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'redactor2_rails'
  spec.version       = Redactor2Rails::VERSION
  spec.authors       = ['Oleg Sulyanov']
  spec.email         = ['oleg@sulyanov.com']

  spec.summary       = 'Imperavi Redactor for Rails 3.x - 4 Asset Pipeline'
  spec.homepage      = 'https://github.com/osulyanov/redactor2_rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency('devise')
  spec.add_dependency('mime-types')
  spec.add_dependency('orm_adapter')

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
