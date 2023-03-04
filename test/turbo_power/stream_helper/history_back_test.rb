# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class HistoryBackTest < StreamHelperTestCase
      test "history_back" do
        stream = %(<turbo-stream action="history_back"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_back
      end

      test "history_back with additional arguments" do
        stream = %(<turbo-stream action="history_back" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_back(something: "else")
      end
    end
  end
end
