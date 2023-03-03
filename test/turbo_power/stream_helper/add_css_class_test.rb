# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class AddCSSClassTest < StreamHelperTestCase
      test "add_css_class" do
        stream = %(<turbo-stream targets="#element" action="add_css_class" classes="container text-center"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class("#element", "container text-center")
      end

      test "add_css_class with targets and classes as kwargs" do
        stream = %(<turbo-stream targets="#element" action="add_css_class" classes="container text-center"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class(targets: "#element", classes: "container text-center")
      end

      test "add_css_class with target and classes as kwargs" do
        stream = %(<turbo-stream target="element" action="add_css_class" classes="container text-center"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class(target: "element", classes: "container text-center")
      end

      test "add_css_class with classes and targets as kwargs" do
        stream = %(<turbo-stream targets="#element" action="add_css_class" classes="container text-center"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class(classes: "container text-center", targets: "#element")
      end

      test "add_css_class with targets as positional arg and classes as kwarg" do
        stream = %(<turbo-stream targets="#element" action="add_css_class" classes="container text-center"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class("#element", classes: "container text-center")
      end

      test "add_css_class with targets/classes as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="add_css_class" classes="bg-white text-left"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class("#element", "container text-center", targets: "#better-input", classes: "bg-white text-left")
      end

      test "add_css_class with additional arguments" do
        stream = %(<turbo-stream targets="#element" action="add_css_class" classes="container text-center" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class("#element", classes: "container text-center", something: "else")
      end

      test "add_css_class with classes as array" do
        stream = %(<turbo-stream targets="#element" action="add_css_class" classes="container text-center"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class("#element", ["container", "text-center"])
      end

      test "add_css_class with classes as array and kwarg" do
        stream = %(<turbo-stream targets="#element" action="add_css_class" classes="container text-center"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.add_css_class("#element", classes: ["container", "text-center"])
      end
    end
  end
end
