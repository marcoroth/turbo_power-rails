# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetCookieTest < StreamHelperTestCase
      test "set_cookie with no arg" do
        stream = %(<turbo-stream cookie="" action="set_cookie"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie
      end

      test "set_cookie" do
        stream = %(<turbo-stream cookie="name=turbo_power; SameSite=None; Secure" action="set_cookie"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie("name=turbo_power; SameSite=None; Secure")
      end

      test "set_cookie with kwarg" do
        stream = %(<turbo-stream cookie="name=turbo_power; SameSite=None; Secure" action="set_cookie"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie(cookie: "name=turbo_power; SameSite=None; Secure")
      end

      test "set_cookie with additonal attributes" do
        stream = %(<turbo-stream cookie="name=turbo_power; SameSite=None; Secure" action="set_cookie" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_cookie(cookie: "name=turbo_power; SameSite=None; Secure", something: "else")
      end
    end
  end
end
