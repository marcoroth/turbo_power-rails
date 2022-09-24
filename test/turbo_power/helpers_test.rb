# frozen_string_literal: true

require "test_helper"

module TurboPower
  class HelpersTest < ActionDispatch::IntegrationTest
    test "Turbo tag builder includes TurboPower stream helpers" do
      assert_includes Turbo::Streams::TagBuilder, TurboPower::StreamHelper
    end
  end
end
