# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class PushStateTest < StreamHelperTestCase
      test "push_state" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="" state="{}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state("/users/1")
      end

      test "push_state with title" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="User 1" state="{}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state("/users/1", "User 1")
      end

      test "push_state with title and state" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="User 1" state="{&quot;user&quot;:1}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state("/users/1", "User 1", { user: 1 })
      end

      test "push_state with url kwarg" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="" state="{}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state(url: "/users/1")
      end

      test "push_state with url and title kwarg" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="User 1" state="{}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state(url: "/users/1", title: "User 1")
      end

      test "push_state with url, title and state as kwargs" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="User 1" state="{&quot;user&quot;:1}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state(url: "/users/1", title: "User 1", state: { user: 1 })
      end

      test "push_state with url and title as pos arg and state as kwarg" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="User 1" state="{&quot;user&quot;:1}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state("/users/1", "User 1", state: { user: 1 })
      end

      test "push_state with url as pos arg and title and state as kwargs" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="User 1" state="{&quot;user&quot;:1}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state("/users/1", title: "User 1", state: { user: 1 })
      end

      test "push_state with targets/value as positional arg and kwarg" do
        stream = %(<turbo-stream action="push_state" url="/users/2" title="User 2" state="{&quot;user&quot;:2}"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state("/users/1", "User 1", { user: 1 }, url: "/users/2", title: "User 2", state: { user: 2 })
      end

      test "push_state with additional arguments" do
        stream = %(<turbo-stream action="push_state" url="/users/1" title="User 1" state="{&quot;user&quot;:1}" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.push_state("/users/1", title: "User 1", state: { user: 1 }, something: "else")
      end
    end
  end
end
