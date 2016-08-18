# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xpub/markdown/version'

Gem::Specification.new do |spec|
  spec.name          = 'xpub-markdown'
  spec.version       = Xpub::Markdown::VERSION
  spec.authors       = ['Yoshihisa AMAKATA']
  spec.email         = ['amakata@gmail.com']
  spec.summary       = 'Xpub::Markdown is Markdown parser based on kpeg'
  spec.description   = 'Xpub::Markdown is Markdown parser based on kpeg'
  spec.homepage      = 'https://github.com/Amakata/xpub-markdown'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 11.1.2'

  spec.add_dependency 'rainbow', '~> 2.1.0'
  spec.add_dependency 'kpeg', '~> 1.1.0'
end
