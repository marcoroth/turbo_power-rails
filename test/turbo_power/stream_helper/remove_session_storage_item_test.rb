# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class RemoveSessionStorageItemTest < StreamHelperTestCase
      test "remove_session_storage_item" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item("current-user")
      end

      test "remove_session_storage_item with key as kwarg" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item(key: "current-user")
      end

      test "remove_session_storage_item with key as arg and kwarg" do
        stream = %(<turbo-stream type="session" key="user" action="remove_storage_item"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item("current-user", key: "user")
      end

      test "remove_session_storage_item with additional arguments" do
        stream = %(<turbo-stream type="session" key="current-user" action="remove_storage_item" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.remove_session_storage_item("current-user", something: "else")
      end
    end
  end
end
