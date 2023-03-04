# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class HistoryForwardTest < StreamHelperTestCase
      test "history_forward" do
        stream = %(<turbo-stream action="history_forward"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_forward
      end

      test "history_forward with additional attributes" do
        stream = %(<turbo-stream action="history_forward" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_forward(something: "else")
      end
    end
  end
end
