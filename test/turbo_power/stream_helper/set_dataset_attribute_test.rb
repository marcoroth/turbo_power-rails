# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetDatasetAttributeTest < StreamHelperTestCase
      test "set_dataset_attribute" do
        stream = %(<turbo-stream action="set_dataset_attribute" targets="#element" attribute="controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_dataset_attribute("#element", "controller", "example")
      end

      test "set_dataset_attribute with targets and attribute as pos arg and value as kwarg" do
        stream = %(<turbo-stream action="set_dataset_attribute" targets="#element" attribute="controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_dataset_attribute("#element", "controller", value: "example")
      end

      test "set_dataset_attribute with targets as pos arg and attribute and value as kwargs" do
        stream = %(<turbo-stream action="set_dataset_attribute" targets="#element" attribute="controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_dataset_attribute("#element", attribute: "controller", value: "example")
      end

      test "set_dataset_attribute with targets, attribute and value as kwargs" do
        stream = %(<turbo-stream action="set_dataset_attribute" targets="#element" attribute="controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_dataset_attribute(targets: "#element", attribute: "controller", value: "example")
      end

      test "set_dataset_attribute with target, attribute and value as kwargs" do
        stream = %(<turbo-stream action="set_dataset_attribute" target="element" attribute="controller" value="example"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_dataset_attribute(target: "element", attribute: "controller", value: "example")
      end

      test "set_dataset_attribute with targets/value as positional arg and kwarg" do
        stream = %(<turbo-stream action="set_dataset_attribute" targets="#better-element" attribute="action" value="click->example#load"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_dataset_attribute("#element", "controller", "example", targets: "#better-element", attribute: "action", value: "click->example#load")
      end

      test "set_dataset_attribute with additional arguments" do
        stream = %(<turbo-stream action="set_dataset_attribute" targets="#element" attribute="controller" value="example" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_dataset_attribute("#element", attribute: "controller", value: "example", something: "else")
      end
    end
  end
end
