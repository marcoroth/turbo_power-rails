# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ResetFormTest < StreamHelperTestCase
      test "reset_form" do
        stream = %(<turbo-stream action="reset_form" targets="#form"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reset_form("#form")
      end
    end
  end
end
