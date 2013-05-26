# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-sprinkle/version'

Gem::Specification.new do |spec|
  spec.name          = 'vagrant-sprinkle'
  spec.version       = VagrantPlugins::Sprinkle::VERSION
  spec.authors       = ['Jimmy Cuadra']
  spec.email         = ['jimmy@jimmycuadra.com']
  spec.description   = %q{A Sprinkle provisioner for Vagrant.}
  spec.summary       = <<-SUMMARY
A Vagrant plugin which adds the ability to provision virtual machines with
the Sprinkle gem.
SUMMARY
  spec.homepage      = 'https://github.com/jimmycuadra/vagrant-sprinkle'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'sprinkle', '>= 0.5'
  # activesupport 3.2.13 hardcodes i18n 0.6.1 :(
  spec.add_runtime_dependency 'activesupport', '!= 3.2.13'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
