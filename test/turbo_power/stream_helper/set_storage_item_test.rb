# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class RemoveStorageItemTest < StreamHelperTestCase
      test "set_storage_item type=local" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", "local")
      end

      test "set_storage_item type=session" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", "session")
      end

      test "set_storage_item with type as kwarg and type=local" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", type: "local")
      end

      test "set_storage_item with type as kwarg and type=session" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", type: "session")
      end

      test "set_storage_item with value and type as kwarg and type=local" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", value: "1", type: "local")
      end

      test "set_storage_item with value and type as kwarg and type=session" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", value: "1", type: "session")
      end

      test "set_storage_item with key, value and type=local as kwarg" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item(key: "current-user", value: "1", type: "local")
      end

      test "set_storage_item with key, value and type=session as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item(key: "current-user", value: "1", type: "session")
      end

      test "set_storage_item with key and type as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" value="2" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", "local", key: "user", value: "2", type: "session")
      end

      test "set_storage_item with additional arguments" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" something="else" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", "local", something: "else")
      end

      test "set_local_storage_item" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_local_storage_item("current-user", "1")
      end

      test "set_session_storage_item" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", "1")
      end

      test "set_local_storage_item with value as kwarg" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_local_storage_item("current-user", value: "1")
      end

      test "set_session_storage_item with value as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", value: "1")
      end

      test "set_local_storage_item with key and value as kwarg" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_local_storage_item(key: "current-user", value: "1")
      end

      test "set_session_storage_item with key and value as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item(key: "current-user", value: "1")
      end

      test "set_local_storage_item with key and value as arg and kwarg" do
        stream = %(<turbo-stream type="local" key="user" value="2" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_local_storage_item("current-user", "1", key: "user", value: "2")
      end

      test "set_session_storage_item with key as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" value="2" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", "1", key: "user", value: "2")
      end

      test "set_local_storage_item with additional arguments" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_local_storage_item("current-user", "1", something: "else")
      end

      test "set_session_storage_item with additional arguments" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", "1", something: "else")
      end
    end
  end
end
