# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ScrollIntoViewTest < StreamHelperTestCase
      test "scroll_into_view" do
        stream = %(<turbo-stream targets="#element" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element")
      end

      test "scroll_into_view with targets as kwarg" do
        stream = %(<turbo-stream targets="#element" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view(targets: "#element")
      end

      test "scroll_into_view with target as kwarg" do
        stream = %(<turbo-stream target="element" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view(target: "element")
      end

      test "scroll_into_view with targets as arg and kwarg" do
        stream = %(<turbo-stream targets="#better-element" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", targets: "#better-element")
      end

      test "scroll_into_view with target and align-to-top as positional args" do
        stream = %(<turbo-stream align-to-top="true" targets="#element" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", true)
      end

      test "scroll_into_view with target as positional arg and align-to-top as both arg and kwarg" do
        stream = %(<turbo-stream targets="#element" action="scroll_into_view" align-to-top="false"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", true, align_to_top: false)
      end

      test "scroll_into_view with target and align-to-top as positional args and additionl argumenets" do
        stream = %(<turbo-stream align-to-top="true" something="else" targets="#element" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", true, something: "else")
      end

      test "scroll_into_view with target as positional arg and block as kwarg" do
        stream = %(<turbo-stream targets="#element" action="scroll_into_view" block="end"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", block: "end")
      end

      test "scroll_into_view with target as positional arg and behavior as kwarg" do
        stream = %(<turbo-stream targets="#element" action="scroll_into_view" behavior="smooth"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", behavior: "smooth")
      end

      test "scroll_into_view with target as positional arg and inline as kwarg" do
        stream = %(<turbo-stream inline="nearest" action="scroll_into_view" targets="#element"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", inline: "nearest")
      end

      test "scroll_into_view with target as positional arg and options as kwargs" do
        stream = %(<turbo-stream block="end" behavior="smooth" inline="nearest" action="scroll_into_view" targets="#element"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", block: "end", behavior: "smooth", inline: "nearest")
      end

      test "scroll_into_view with target and options as kwargs" do
        stream = %(<turbo-stream block="end" behavior="smooth" inline="nearest" action="scroll_into_view" target="#element"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view(target: "#element", block: "end", behavior: "smooth", inline: "nearest")
      end

      test "scroll_into_view with target, align_to_top and options as kwargs" do
        stream = %(<turbo-stream block="end" behavior="smooth" inline="nearest" align-to-top="true" action="scroll_into_view" target="#element"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view(target: "#element", align_to_top: true, block: "end", behavior: "smooth", inline: "nearest")
      end

      test "scroll_into_view with additional arguments" do
        stream = %(<turbo-stream targets="#element" something="else" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", something: "else")
      end
    end
  end
end
