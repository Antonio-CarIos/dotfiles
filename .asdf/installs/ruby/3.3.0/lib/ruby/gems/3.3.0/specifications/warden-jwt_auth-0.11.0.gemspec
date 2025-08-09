# -*- encoding: utf-8 -*-
# stub: warden-jwt_auth 0.11.0 ruby lib

Gem::Specification.new do |s|
  s.name = "warden-jwt_auth".freeze
  s.version = "0.11.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Marc Busqu\u00E9".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-12-20"
  s.description = "JWT authentication for Warden, ORM agnostic and accepting the implementation of token revocation strategies.".freeze
  s.email = ["marc@lamarciana.com".freeze]
  s.homepage = "https://github.com/waiting-for-dev/warden-jwt_auth".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.3".freeze
  s.summary = "JWT authentication for Warden.".freeze

  s.installed_by_version = "3.5.3".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<dry-auto_inject>.freeze, [">= 0.8".freeze, "< 2".freeze])
  s.add_runtime_dependency(%q<dry-configurable>.freeze, [">= 0.13".freeze, "< 2".freeze])
  s.add_runtime_dependency(%q<jwt>.freeze, ["~> 2.1".freeze])
  s.add_runtime_dependency(%q<warden>.freeze, ["~> 1.2".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<pry-byebug>.freeze, ["~> 3.7".freeze])
  s.add_development_dependency(%q<rack-test>.freeze, ["~> 1.1".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.3".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.8".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.87".freeze])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 1.42".freeze])
  s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["= 0.17".freeze])
end
