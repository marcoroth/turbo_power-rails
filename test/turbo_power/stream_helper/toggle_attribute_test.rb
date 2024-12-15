# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ToggleAttributeTest < StreamHelperTestCase
      test "toggle_attribute" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", "disabled")
      end

      test "toggle_attribute with targets and attribute as kwargs" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute(targets: "#element", attribute: "disabled")
      end

      test "toggle_attribute with target and attribute as kwargs" do
        stream = %(<turbo-stream target="element" action="toggle_attribute" attribute="disabled" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute(target: "element", attribute: "disabled")
      end

      test "toggle_attribute with attribute and targets as kwargs" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute(attribute: "disabled", targets: "#element")
      end

      test "toggle_attribute with targets as positional arg and attribute as kwarg" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", attribute: "disabled")
      end

      test "toggle_attribute with targets/attribute as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="toggle_attribute" attribute="other-disabled" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", "disabled", targets: "#better-input", attribute: "other-disabled")
      end

      test "toggle_attribute with additional arguments" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" something="else" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", attribute: "disabled", something: "else")
      end

      test "toggle_attribute with force as positional arg" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", "disabled", "true")
      end

      test "toggle_attribute with force as kwarg" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", attribute: "disabled", force: "true")
      end

      test "toggle_attribute with force as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", attribute: "disabled", force: "true")
      end

      test "toggle_attribute with force as boolean (true)" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", attribute: "disabled", force: true)
      end

      test "toggle_attribute with force as boolean (false)" do
        stream = %(<turbo-stream targets="#element" action="toggle_attribute" attribute="disabled" force="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.toggle_attribute("#element", attribute: "disabled", force: false)
      end
    end
  end
end
