# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ClearSessionStorageTest < StreamHelperTestCase
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
