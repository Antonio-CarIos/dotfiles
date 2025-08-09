# -*- encoding: utf-8 -*-
# stub: pagseguro-oficial 2.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "pagseguro-oficial".freeze
  s.version = "2.4.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nando Vieira".freeze]
  s.date = "2015-11-16"
  s.description = "Biblioteca oficial de integra\u00E7\u00E3o PagSeguro em Ruby".freeze
  s.email = ["fnando.vieira@gmail.com".freeze]
  s.homepage = "http://www.pagseguro.com.br".freeze
  s.licenses = ["ASL".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Biblioteca oficial de integra\u00E7\u00E3o PagSeguro em Ruby".freeze

  s.installed_by_version = "3.5.3".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<aitch>.freeze, [">= 0.2.1".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<i18n>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<json>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<autotest-standalone>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<fakeweb>.freeze, [">= 0".freeze])
end
