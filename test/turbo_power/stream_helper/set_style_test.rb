# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetStyleTest < StreamHelperTestCase
      test "set_style" do
        stream = %(<turbo-stream action="set_style" targets="#element" name="background" value="black"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_style("#element", "background", "black")
      end

      test "set_style with targets and name as pos arg and value as kwarg" do
        stream = %(<turbo-stream action="set_style" targets="#element" name="background" value="black"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_style("#element", "background", value: "black")
      end

      test "set_style with targets as pos arg and name and value as kwargs" do
        stream = %(<turbo-stream action="set_style" targets="#element" name="background" value="black"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_style("#element", name: "background", value: "black")
      end

      test "set_style with targets, name and value as kwargs" do
        stream = %(<turbo-stream action="set_style" targets="#element" name="background" value="black"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_style(targets: "#element", name: "background", value: "black")
      end

      test "set_style with targets/value as positional arg and kwarg" do
        stream = %(<turbo-stream action="set_style" targets="#better-element" name="color" value="white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_style("#element", "background", "black", targets: "#better-element", name: "color", value: "white")
      end

      test "set_style with additional arguments" do
        stream = %(<turbo-stream action="set_style" targets="#element" name="background" value="black" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_style("#element", name: "background", value: "black", something: "else")
      end
    end
  end
end
