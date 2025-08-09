# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "latest/version"

Gem::Specification.new do |s|

  s.name        = "latest"
  s.version     = Latest::VERSION
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = "https://github.com/citrus/latest"
  s.summary     = %q{Latest queries rubygems.org for the latest version of a gem.}
  s.description = %q{Latest keeps us up to speed by querying rubygems.org for a gem's most recent version number. Yep, that's all it does.}

  s.rubyforge_project = "latest"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.required_ruby_version = ">= 1.9.2"

  s.add_development_dependency "rake",     "> 0"
  s.add_development_dependency "bundler",  "> 0"
  
end
