# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class TurboProgressBarHideTest < StreamHelperTestCase
      test "turbo_progress_bar_hide" do
        stream = %(<turbo-stream action="turbo_progress_bar_hide"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_hide
      end

      test "turbo_progress_bar_hide with additional attributes" do
        stream = %(<turbo-stream action="turbo_progress_bar_hide" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_hide(something: "else")
      end
    end
  end
end
