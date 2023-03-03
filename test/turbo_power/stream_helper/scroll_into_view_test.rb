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

      test "scroll_into_view with additional arguments" do
        stream = %(<turbo-stream targets="#element" something="else" action="scroll_into_view"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.scroll_into_view("#element", something: "else")
      end
    end
  end
end
