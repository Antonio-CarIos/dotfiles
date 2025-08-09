# -*- encoding: utf-8 -*-
# stub: latest 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "latest".freeze
  s.version = "0.4.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Spencer Steffen".freeze]
  s.date = "2012-03-07"
  s.description = "Latest keeps us up to speed by querying rubygems.org for a gem's most recent version number. Yep, that's all it does.".freeze
  s.email = ["spencer@citrusme.com".freeze]
  s.executables = ["latest".freeze]
  s.files = ["bin/latest".freeze]
  s.homepage = "https://github.com/citrus/latest".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubygems_version = "1.8.11".freeze
  s.summary = "Latest queries rubygems.org for the latest version of a gem.".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 3

  s.add_development_dependency(%q<rake>.freeze, ["> 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["> 0".freeze])
end
