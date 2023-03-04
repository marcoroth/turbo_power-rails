# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require_relative "../test/dummy/config/environment"
require "rails/test_help"

require "turbo_power"
require "turbo_stream_helper"
require "stream_helper_test_case"
