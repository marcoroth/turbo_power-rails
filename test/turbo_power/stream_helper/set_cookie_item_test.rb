# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetCookieItemTest < StreamHelperTestCase
      test "set_cookie_item" do
        stream = %(<turbo-stream key="my-key" value="my-value" action="set_cookie_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item("my-key", "my-value")
      end

      test "set_cookie_item with value kwarg" do
        stream = %(<turbo-stream key="my-key" value="my-value" action="set_cookie_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item("my-key", value: "my-value")
      end

      test "set_cookie_item with key and value kwargs" do
        stream = %(<turbo-stream key="my-key" value="my-value" action="set_cookie_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item(key: "my-key", value: "my-value")
      end

      test "set_cookie_item with value and key kwargs" do
        stream = %(<turbo-stream key="my-key" value="my-value" action="set_cookie_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item(value: "my-value", key: "my-key")
      end

      test "set_cookie_item with value and key as args and kwargs" do
        stream = %(<turbo-stream key="better-key" value="better-value" action="set_cookie_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item("my-value", "my-key", value: "better-value", key: "better-key")
      end

      test "set_cookie_item with additonal attributes" do
        stream = %(<turbo-stream key="my-key" value="my-value" action="set_cookie_item" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item(key: "my-key", value: "my-value", something: "else")
      end
    end
  end
end
