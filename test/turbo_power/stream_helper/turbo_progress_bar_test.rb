# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class TurboProgressBarTest < StreamHelperTestCase
      test "turbo_progress_bar_show" do
        stream = %(<turbo-stream action="turbo_progress_bar_show"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_show
      end

      test "turbo_progress_bar_hide" do
        stream = %(<turbo-stream action="turbo_progress_bar_hide"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_hide
      end

      test "turbo_progress_bar_set_value with nil" do
        stream = %(<turbo-stream value="" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(nil)
      end

      test "turbo_progress_bar_set_value with zero" do
        stream = %(<turbo-stream value="0" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(0)
      end

      test "turbo_progress_bar_set_value with float" do
        stream = %(<turbo-stream value="0.5" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(0.5)
      end

      test "turbo_progress_bar_set_value with integer" do
        stream = %(<turbo-stream value="1" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(1)
      end
    end
  end
end
