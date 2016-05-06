# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/universe/version'

Gem::Specification.new do |spec|
  spec.name        = 'omniauth-universe'
  spec.version     = OmniAuth::Universe::VERSION
  spec.authors     = ['John-Alan Simmons']
  spec.email       = ['simmons.johnalan@gmail.com']
  spec.homepage    = 'https://github.com/conferencecloud/omniauth-universe'
  spec.summary     = 'Universe OAuth2 strategy for OmniAuth'
  spec.description = spec.summary
  spec.license     = 'MIT'

  spec.files = %w(LICENSE.md README.md
                  omniauth-universe.gemspec) + Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.0'
end
