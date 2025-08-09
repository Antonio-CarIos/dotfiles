# -*- encoding: utf-8 -*-
# stub: prism 0.19.0 ruby lib
# stub: ext/prism/extconf.rb

Gem::Specification.new do |s|
  s.name = "prism".freeze
  s.version = "0.19.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/ruby/prism/blob/main/CHANGELOG.md", "source_code_uri" => "https://github.com/ruby/prism" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shopify".freeze]
  s.date = "2023-12-25"
  s.email = ["ruby@shopify.com".freeze]
  s.extensions = ["ext/prism/extconf.rb".freeze]
  s.files = ["ext/prism/extconf.rb".freeze, "lib/prism.rb".freeze, "lib/prism/compiler.rb".freeze, "lib/prism/debug.rb".freeze, "lib/prism/desugar_compiler.rb".freeze, "lib/prism/dispatcher.rb".freeze, "lib/prism/dsl.rb".freeze, "lib/prism/ffi.rb".freeze, "lib/prism/lex_compat.rb".freeze, "lib/prism/mutation_compiler.rb".freeze, "lib/prism/node.rb".freeze, "lib/prism/node_ext.rb".freeze, "lib/prism/node_inspector.rb".freeze, "lib/prism/pack.rb".freeze, "lib/prism/parse_result.rb".freeze, "lib/prism/parse_result/comments.rb".freeze, "lib/prism/parse_result/newlines.rb".freeze, "lib/prism/pattern.rb".freeze, "lib/prism/ripper_compat.rb".freeze, "lib/prism/serialize.rb".freeze, "lib/prism/visitor.rb".freeze]
  s.homepage = "https://github.com/ruby/prism".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Prism Ruby parser".freeze
end
