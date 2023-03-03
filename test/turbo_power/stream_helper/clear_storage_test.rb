# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ClearStorageTest < StreamHelperTestCase
      test "clear_storage type=local" do
        stream = %(<turbo-stream type="local" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage("local")
      end

      test "clear_storage type=session" do
        stream = %(<turbo-stream type="session" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage("session")
      end

      test "clear_storage with type=local as kwarg" do
        stream = %(<turbo-stream type="local" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage(type: "local")
      end

      test "clear_storage with type=session as kwarg" do
        stream = %(<turbo-stream type="session" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage(type: "session")
      end

      test "clear_storage with type as arg and kwarg" do
        stream = %(<turbo-stream type="session" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage("local", type: "session")
      end

      test "clear_storage with additional arguments" do
        stream = %(<turbo-stream type="local" something="else" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage("local", something: "else")
      end

      test "clear_local_storage" do
        stream = %(<turbo-stream type="local" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_local_storage
      end

      test "clear_local_storage with additional arguments" do
        stream = %(<turbo-stream type="local" something="else" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_local_storage(something: "else")
      end

      test "clear_session_storage" do
        stream = %(<turbo-stream type="session" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_session_storage
      end

      test "clear_session_storage with additional arguments" do
        stream = %(<turbo-stream type="session" something="else" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_session_storage(something: "else")
      end
    end
  end
end
