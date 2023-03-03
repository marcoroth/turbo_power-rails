# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class RemoveStorageItemTest < StreamHelperTestCase
      test "remove_storage_item type=local" do
        stream = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", "local")
      end

      test "remove_storage_item type=session" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", "session")
      end

      test "remove_storage_item with type as kwarg and type=local" do
        stream = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", type: "local")
      end

      test "remove_storage_item with type as kwarg and type=session" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", type: "session")
      end

      test "remove_storage_item with key and type=local as kwarg" do
        stream = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item(key: "current-user", type: "local")
      end

      test "remove_storage_item with key and type=session as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item(key: "current-user", type: "session")
      end

      test "remove_storage_item with key and type as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", "local", key: "user", type: "session")
      end

      test "remove_storage_item with additional arguments" do
        stream = %(<turbo-stream type="local" key="current-user" something="else" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", "local", something: "else")
      end


      test "remove_local_storage_item" do
        stream = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_local_storage_item("current-user")
      end

      test "remove_session_storage_item" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item("current-user")
      end

      test "remove_local_storage_item with key as kwarg" do
        stream = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_local_storage_item(key: "current-user")
      end

      test "remove_session_storage_item with key as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item(key: "current-user")
      end

      test "remove_local_storage_item with key as arg and kwarg" do
        stream = %(<turbo-stream type="local" key="user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_local_storage_item("current-user", key: "user")
      end

      test "remove_session_storage_item with key as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item("current-user", key: "user")
      end

      test "remove_local_storage_item with additional arguments" do
        stream = %(<turbo-stream type="local" key="current-user" action="remove_storage_item" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_local_storage_item("current-user", something: "else")
      end

      test "remove_session_storage_item with additional arguments" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item("current-user", something: "else")
      end
    end
  end
end
