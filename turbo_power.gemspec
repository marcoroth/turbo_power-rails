# frozen_string_literal: true

require_relative "lib/turbo_power/version"

Gem::Specification.new do |spec|
  spec.name = "turbo_power"
  spec.version = TurboPower::VERSION
  spec.authors = ["Marco Roth"]
  spec.email = ["marco.roth@hey.com"]

  spec.summary = "Power-pack for Turbo Streams"
  spec.description = spec.summary
  spec.homepage = "https://github.com/marcoroth/turbo_power-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/marcoroth/turbo_power-rails"
  spec.metadata["changelog_uri"] = "https://github.com/marcoroth/turbo_power-rails/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir[
    "lib/**/*.{rb,rake}",
    "app/**/*.rb",
    "config/**/*.rb",
    "bin/*",
    "[A-Z]*"
  ]

  spec.add_dependency "turbo-rails", ">= 1.3.0"
end
