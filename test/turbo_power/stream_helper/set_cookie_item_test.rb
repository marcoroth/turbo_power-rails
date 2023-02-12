# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetCookieItemTest < StreamHelperTestCase
      test "set_cookie_item" do
        stream = %(<turbo-stream key="my-key" value="my-value" action="set_cookie_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item("my-key", "my-value")
      end

      test "set_cookie_item with kwargs" do
        stream = %(<turbo-stream key="my-key" value="my-value" action="set_cookie_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie_item(key: "my-key", value: "my-value")
      end
    end
  end
end
