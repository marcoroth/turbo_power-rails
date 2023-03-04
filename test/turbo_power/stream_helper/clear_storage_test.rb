# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ClearStorageTest < StreamHelperTestCase
      test "clear_storage" do
        stream_local = %(<turbo-stream type="local" action="clear_storage"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.clear_storage("local")
        assert_dom_equal stream_session, turbo_stream.clear_storage("session")
      end

      test "clear_storage as kwarg" do
        stream_local = %(<turbo-stream type="local" action="clear_storage"><template></template></turbo-stream>)
        stream_session = %(<turbo-stream type="session" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream_local, turbo_stream.clear_storage(type: "local")
        assert_dom_equal stream_session, turbo_stream.clear_storage(type: "session")
      end

      test "clear_storage with type as arg and kwarg" do
        stream = %(<turbo-stream type="session" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage("local", type: "session")
      end

      test "clear_storage with additional arguments" do
        stream = %(<turbo-stream type="local" something="else" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_storage("local", something: "else")
      end
    end
  end
end
