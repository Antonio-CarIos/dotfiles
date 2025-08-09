# -*- encoding: utf-8 -*-
# stub: active_model_serializers 0.10.15 ruby lib

Gem::Specification.new do |s|
  s.name = "active_model_serializers".freeze
  s.version = "0.10.15".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steve Klabnik".freeze]
  s.date = "2024-12-01"
  s.description = "ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.".freeze
  s.email = ["steve@steveklabnik.com".freeze]
  s.homepage = "https://github.com/rails-api/active_model_serializers".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Conventions-based JSON generation for Rails.".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<activemodel>.freeze, [">= 4.1".freeze])
  s.add_runtime_dependency(%q<actionpack>.freeze, [">= 4.1".freeze])
  s.add_development_dependency(%q<railties>.freeze, [">= 4.1".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze, "< 5.11".freeze])
  s.add_runtime_dependency(%q<jsonapi-renderer>.freeze, [">= 0.1.1.beta1".freeze, "< 0.3".freeze])
  s.add_runtime_dependency(%q<case_transform>.freeze, [">= 0.2".freeze])
  s.add_development_dependency(%q<activerecord>.freeze, [">= 4.1".freeze])
  s.add_development_dependency(%q<kaminari>.freeze, ["~> 0.16.3".freeze])
  s.add_development_dependency(%q<will_paginate>.freeze, ["~> 3.0".freeze, ">= 3.0.7".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<timecop>.freeze, ["~> 0.7".freeze])
  s.add_development_dependency(%q<grape>.freeze, [">= 0.13".freeze])
  s.add_development_dependency(%q<json_schema>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 10.0".freeze])
end
