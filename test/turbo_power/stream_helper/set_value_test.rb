# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetValueTest < StreamHelperTestCase
      test "set_value" do
        stream = %(<turbo-stream targets="#input" action="set_value" value="Value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_value("#input", "Value")
      end

      test "set_value with targets and value as kwargs" do
        stream = %(<turbo-stream targets="#input" action="set_value" value="Value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_value(targets: "#input", value: "Value")
      end

      test "set_value with target and value as kwargs" do
        stream = %(<turbo-stream target="input" action="set_value" value="Value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_value(target: "input", value: "Value")
      end

      test "set_value with value and targets as kwargs" do
        stream = %(<turbo-stream targets="#input" action="set_value" value="Value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_value(value: "Value", targets: "#input")
      end

      test "set_value with targets as positional arg and value as kwarg" do
        stream = %(<turbo-stream targets="#input" action="set_value" value="Value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_value("#input", value: "Value")
      end

      test "set_value with targets/value as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="set_value" value="Better Value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_value("#input", "Value", targets: "#better-input", value: "Better Value")
      end

      test "set_value with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="set_value" value="Value" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_value("#input", value: "Value", something: "else")
      end
    end
  end
end
