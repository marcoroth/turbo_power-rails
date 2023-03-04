# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class RemoveAttributeTest < StreamHelperTestCase
      test "remove_attribute" do
        stream = %(<turbo-stream targets="#input" action="remove_attribute" attribute="data-controller"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_attribute("#input", "data-controller")
      end

      test "remove_attribute with attribute as kwarg" do
        stream = %(<turbo-stream targets="#input" action="remove_attribute" attribute="data-controller"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_attribute("#input", attribute: "data-controller")
      end

      test "remove_attribute with targets and attribute as kwargs" do
        stream = %(<turbo-stream targets="#input" action="remove_attribute" attribute="data-controller"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_attribute(targets: "#input", attribute: "data-controller")
      end

      test "remove_attribute with attribute and targets as kwargs" do
        stream = %(<turbo-stream targets="#input" action="remove_attribute" attribute="data-controller"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_attribute(attribute: "data-controller", targets: "#input")
      end

      test "remove_attribute with target and attribute as kwargs" do
        stream = %(<turbo-stream target="input" action="remove_attribute" attribute="data-controller"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_attribute(target: "input", attribute: "data-controller")
      end

      test "remove_attribute with targets/attribute as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="remove_attribute" attribute="data-action"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_attribute("#input", "data-controller", targets: "#better-input", attribute: "data-action")
      end

      test "remove_attribute with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="remove_attribute" attribute="data-controller" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_attribute("#input", attribute: "data-controller", something: "else")
      end
    end
  end
end
