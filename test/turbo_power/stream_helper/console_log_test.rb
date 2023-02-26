# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ConsoleLogTest < StreamHelperTestCase
      test "console_log" do
        stream = %(<turbo-stream level="log" message="Message" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log("Message")
      end

      test "console_log with message and level" do
        stream = %(<turbo-stream level="warn" message="Message" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log("Message", "warn")
      end
    end
  end
end
