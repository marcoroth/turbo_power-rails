# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class RemoveStorageItemTest < StreamHelperTestCase
      test "remove_storage_item" do
        stream_local = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.remove_storage_item("current-user", "local")
        assert_dom_equal stream_session, turbo_stream.remove_storage_item("current-user", "session")
      end

      test "remove_storage_item with type as kwarg and type=local" do
        stream_local = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.remove_storage_item("current-user", type: "local")
        assert_dom_equal stream_session, turbo_stream.remove_storage_item("current-user", type: "session")
      end

      test "remove_storage_item with key and type as kwarg" do
        stream_local = %(<turbo-stream type="local" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.remove_storage_item(key: "current-user", type: "local")
        assert_dom_equal stream_session, turbo_stream.remove_storage_item(key: "current-user", type: "session")
      end

      test "remove_storage_item with key and type as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", "local", key: "user", type: "session")
      end

      test "remove_storage_item with additional arguments" do
        stream = %(<turbo-stream type="local" key="current-user" something="else" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_storage_item("current-user", "local", something: "else")
      end
    end
  end
end
