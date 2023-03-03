# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetStylesTest < StreamHelperTestCase
      test "set_styles" do
        stream = %(<turbo-stream targets="#element" action="set_styles" styles="background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles("#element", "background: black; color: white")
      end

      test "set_styles with targets and styles as kwargs" do
        stream = %(<turbo-stream targets="#element" action="set_styles" styles="background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles(targets: "#element", styles: "background: black; color: white")
      end

      test "set_styles with target and styles as kwargs" do
        stream = %(<turbo-stream target="element" action="set_styles" styles="background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles(target: "element", styles: "background: black; color: white")
      end

      test "set_styles with styles and targets as kwargs" do
        stream = %(<turbo-stream targets="#element" action="set_styles" styles="background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles(styles: "background: black; color: white", targets: "#element")
      end

      test "set_styles with targets as positional arg and styles as kwarg" do
        stream = %(<turbo-stream targets="#element" action="set_styles" styles="background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles("#element", styles: "background: black; color: white")
      end

      test "set_styles with targets/styles as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="set_styles" styles="Better background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles("#element", "background: black; color: white", targets: "#better-input", styles: "Better background: black; color: white")
      end

      test "set_styles with additional arguments" do
        stream = %(<turbo-stream targets="#element" action="set_styles" styles="background: black; color: white" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles("#element", styles: "background: black; color: white", something: "else")
      end

      test "set_styles with styles as hash" do
        stream = %(<turbo-stream targets="#element" action="set_styles" styles="background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles("#element", { background: "black", color: "white" }, **{})
      end

      test "set_styles with styles as hash and kwarg" do
        stream = %(<turbo-stream targets="element" action="set_styles" styles="background: black; color: white"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_styles("element", styles: { background: "black", color: "white" })
      end
    end
  end
end
