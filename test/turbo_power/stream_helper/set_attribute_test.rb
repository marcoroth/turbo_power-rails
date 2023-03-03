# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetAttributeTest < StreamHelperTestCase
      test "set_attribute" do
        stream = %(<turbo-stream action="set_attribute" targets="#element" attribute="data-controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_attribute("#element", "data-controller", "example")
      end

      test "set_attribute with targets and attribute as pos arg and value as kwarg" do
        stream = %(<turbo-stream action="set_attribute" targets="#element" attribute="data-controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_attribute("#element", "data-controller", value: "example")
      end

      test "set_attribute with targets as pos arg and attribute and value as kwargs" do
        stream = %(<turbo-stream action="set_attribute" targets="#element" attribute="data-controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_attribute("#element", attribute: "data-controller", value: "example")
      end

      test "set_attribute with targets, attribute and value as kwargs" do
        stream = %(<turbo-stream action="set_attribute" targets="#element" attribute="data-controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_attribute(targets: "#element", attribute: "data-controller", value: "example")
      end

      test "set_attribute with target, attribute and value as kwargs" do
        stream = %(<turbo-stream action="set_attribute" target="element" attribute="data-controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_attribute(target: "element", attribute: "data-controller", value: "example")
      end

      test "set_attribute with targets/value as positional arg and kwarg" do
        stream = %(<turbo-stream action="set_attribute" targets="#better-element" attribute="data-action" value="click->example#load"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_attribute("#element", "data-controller", "example", targets: "#better-element", attribute: "data-action", value: "click->example#load")
      end

      test "set_attribute with additional arguments" do
        stream = %(<turbo-stream action="set_attribute" targets="#element" attribute="data-controller" value="example" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_attribute("#element", attribute: "data-controller", value: "example", something: "else")
      end
    end
  end
end
