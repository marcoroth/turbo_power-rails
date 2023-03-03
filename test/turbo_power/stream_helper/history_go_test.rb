# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class HistoryGoTest < StreamHelperTestCase
      test "history_go" do
        stream = %(<turbo-stream delta="0" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(0)
      end

      test "history_go with nil" do
        stream = %(<turbo-stream delta="" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(nil)
      end

      test "history_go with zero" do
        stream = %(<turbo-stream delta="0" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(0)
      end

      test "history_go with one" do
        stream = %(<turbo-stream delta="1" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(1)
      end

      test "history_go with negative one" do
        stream = %(<turbo-stream delta="-1" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(-1)
      end

      test "history_go with integer" do
        stream = %(<turbo-stream delta="9" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(9)
      end

      test "history_go with string" do
        stream = %(<turbo-stream delta="9" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go("9")
      end

      test "history_go with kwarg" do
        stream = %(<turbo-stream delta="1" action="history_go"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(delta: 1)
      end

      test "history_go additional attribute kwarg" do
        stream = %(<turbo-stream delta="1" action="history_go" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.history_go(1, something: "else")
      end
    end
  end
end
