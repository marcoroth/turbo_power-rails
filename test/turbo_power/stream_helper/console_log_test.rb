# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ConsoleLogTest < StreamHelperTestCase
      test "console_log" do
        stream = %(<turbo-stream level="log" message="Message" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log("Message")
      end

      test "console_log with message as kwargs" do
        stream = %(<turbo-stream level="log" message="Message" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log(message: "Message")
      end

      test "console_log with message and level" do
        stream = %(<turbo-stream level="warn" message="Message" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log("Message", "warn")
      end

      test "console_log with message and level as kwargs" do
        stream = %(<turbo-stream level="warn" message="Message" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log(message: "Message", level: "warn")
      end

      test "console_log with message as positional arg and level as kwarg" do
        stream = %(<turbo-stream level="warn" message="Message" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log("Message", level: "warn")
      end

      test "console_log with message/level as positional arg and kwarg" do
        stream = %(<turbo-stream message="Better Message" level="error" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log("Message", "warn", message: "Better Message", level: "error")
      end

      test "console_log with additional arguments" do
        stream = %(<turbo-stream level="warn" message="Message" something="else" action="console_log"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_log("Message", level: "warn", something: "else")
      end
    end
  end
end
