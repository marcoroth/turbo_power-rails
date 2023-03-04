# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetSessionStorageItemTest < StreamHelperTestCase
      test "set_session_storage_item" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", "1")
      end

      test "set_session_storage_item with value as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", value: "1")
      end

      test "set_session_storage_item with key and value as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item(key: "current-user", value: "1")
      end

      test "set_session_storage_item with key as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" value="2" action="set_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", "1", key: "user", value: "2")
      end

      test "set_session_storage_item with additional arguments" do
        stream = %(<turbo-stream type="session" key="current-user" value="1" action="set_storage_item" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_session_storage_item("current-user", "1", something: "else")
      end
    end
  end
end
