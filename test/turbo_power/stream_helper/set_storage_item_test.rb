# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetStorageItemTest < StreamHelperTestCase
      test "set_storage_item" do
        stream_local = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.set_storage_item("current-user", "1", "local")
        assert_dom_equal stream_session, turbo_stream.set_storage_item("current-user", "1", "session")
      end

      test "set_storage_item with type as kwarg" do
        stream_local = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.set_storage_item("current-user", "1", type: "local")
        assert_dom_equal stream_session, turbo_stream.set_storage_item("current-user", "1", type: "session")
      end

      test "set_storage_item with value and type as kwarg" do
        stream_local = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.set_storage_item("current-user", value: "1", type: "local")
        assert_dom_equal stream_session, turbo_stream.set_storage_item("current-user", value: "1", type: "session")
      end

      test "set_storage_item with key, value and type as kwarg" do
        stream_local = %(<turbo-stream type="local" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.set_storage_item(key: "current-user", value: "1", type: "local")
        assert_dom_equal stream_session, turbo_stream.set_storage_item(key: "current-user", value: "1", type: "session")
      end

      test "set_storage_item with key and type as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" value="2" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", "local", key: "user", value: "2", type: "session")
      end

      test "set_storage_item with additional arguments" do
        stream = %(<turbo-stream type="local" key="current-user" value="1" something="else" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_storage_item("current-user", "1", "local", something: "else")
      end
    end
  end
end
