# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ClearLocalStorageTest < StreamHelperTestCase
      test "clear_local_storage" do
        stream = %(<turbo-stream type="local" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_local_storage
      end

      test "clear_local_storage with additional arguments" do
        stream = %(<turbo-stream type="local" something="else" action="clear_storage"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.clear_local_storage(something: "else")
      end
    end
  end
end
