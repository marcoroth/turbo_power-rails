# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetPropertyTest < StreamHelperTestCase
      test "set_property" do
        stream = %(<turbo-stream action="set_property" targets="#element" name="ariaDisabled" value="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_property("#element", "ariaDisabled", "true")
      end

      test "set_property with targets and name as pos arg and value as kwarg" do
        stream = %(<turbo-stream action="set_property" targets="#element" name="ariaDisabled" value="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_property("#element", "ariaDisabled", value: "true")
      end

      test "set_property with targets as pos arg and name and value as kwargs" do
        stream = %(<turbo-stream action="set_property" targets="#element" name="ariaDisabled" value="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_property("#element", name: "ariaDisabled", value: "true")
      end

      test "set_property with targets, name and value as kwargs" do
        stream = %(<turbo-stream action="set_property" targets="#element" name="ariaDisabled" value="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_property(targets: "#element", name: "ariaDisabled", value: "true")
      end

      test "set_property with target, name and value as kwargs" do
        stream = %(<turbo-stream action="set_property" target="element" name="ariaDisabled" value="true"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_property(target: "element", name: "ariaDisabled", value: "true")
      end

      test "set_property with targets/value as positional arg and kwarg" do
        stream = %(<turbo-stream action="set_property" targets="#better-element" name="id" value="even-better-element"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_property("#element", "ariaDisabled", "true", targets: "#better-element", name: "id", value: "even-better-element")
      end

      test "set_property with additional arguments" do
        stream = %(<turbo-stream action="set_property" targets="#element" name="ariaDisabled" value="true" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_property("#element", name: "ariaDisabled", value: "true", something: "else")
      end
    end
  end
end
