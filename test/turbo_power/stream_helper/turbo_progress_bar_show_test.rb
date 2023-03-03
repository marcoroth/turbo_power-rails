# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class TurboProgressBarShowTest < StreamHelperTestCase
      test "turbo_progress_bar_show" do
        stream = %(<turbo-stream action="turbo_progress_bar_show"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_show
      end

      test "turbo_progress_bar_show with additional attributes" do
        stream = %(<turbo-stream action="turbo_progress_bar_show" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_progress_bar_show(something: "else")
      end
    end
  end
end
