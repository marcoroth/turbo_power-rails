# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetFocusTest < StreamHelperTestCase
      test "set_focus" do
        stream = %(<turbo-stream targets="#input" action="set_focus"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_focus("#input")
      end

      test "set_focus with targets and value as kwargs" do
        stream = %(<turbo-stream targets="#input" action="set_focus"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_focus(targets: "#input")
      end

      test "set_focus with target and value as kwargs" do
        stream = %(<turbo-stream target="input" action="set_focus"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_focus(target: "input")
      end

      test "set_focus with targets as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="set_focus"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_focus("#input", targets: "#better-input")
      end

      test "set_focus with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="set_focus" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_focus("#input", something: "else")
      end
    end
  end
end
