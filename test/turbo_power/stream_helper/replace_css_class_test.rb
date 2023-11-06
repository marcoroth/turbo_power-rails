# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ReplaceCSSClassTest < StreamHelperTestCase
      test "replace_css_class" do
        stream = %(<turbo-stream targets="#element" action="replace_css_class" from="one" to="two"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.replace_css_class("#element", "one", "two")
      end

      test "replace_css_class with targets and classes as kwargs" do
        stream = %(<turbo-stream targets="#element" action="replace_css_class" from="one" to="two"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.replace_css_class(targets: "#element", from: "one", to: "two")
      end

      test "replace_css_class with target and classes as kwargs" do
        stream = %(<turbo-stream target="element" action="replace_css_class" from="one" to="two"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.replace_css_class(target: "element", from: "one", to: "two")
      end

      test "replace_css_class with classes and targets as kwargs" do
        stream = %(<turbo-stream targets="#element" action="replace_css_class" from="one" to="two"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.replace_css_class(from: "one", to: "two", targets: "#element")
      end

      test "replace_css_class with targets as positional arg and classes as kwarg" do
        stream = %(<turbo-stream targets="#element" action="replace_css_class" from="one" to="two"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.replace_css_class("#element", from: "one", to: "two")
      end

      test "replace_css_class with targets/classes as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="replace_css_class" from="one" to="two"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.replace_css_class("#element", "container text-center", targets: "#better-input", from: "one", to: "two")
      end

      test "replace_css_class with additional arguments" do
        stream = %(<turbo-stream targets="#element" action="replace_css_class" from="one" to="two" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.replace_css_class("#element", from: "one", to: "two", something: "else")
      end
    end
  end
end
