# frozen_string_literal: true

require_relative "lib/turbo_pack/version"

Gem::Specification.new do |spec|
  spec.name = "turbo_pack"
  spec.version = TurboPack::VERSION
  spec.authors = ["Marco Roth"]
  spec.email = ["marco.roth@hey.com"]

  spec.summary = "Powerpack for Turbo"
  spec.description = spec.summary
  spec.homepage = "https://github.com/marcoroth/turbo_pack"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/marcoroth/turbo_pack"
  spec.metadata["changelog_uri"] = "https://github.com/marcoroth/turbo_pack/blob/main/CHANGELOG.md"

  spec.files = Dir[
    "lib/**/*.{rb,rake}",
    "app/**/*.rb",
    "bin/*",
    "[A-Z]*"
  ]

  spec.test_files = Dir["test/**/*.rb"]

  spec.add_dependency "turbo-rails"
end
