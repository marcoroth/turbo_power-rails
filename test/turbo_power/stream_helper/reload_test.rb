# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ReloadTest < StreamHelperTestCase
      test "reload" do
        stream = %(<turbo-stream action="reload"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reload
      end

      test "reload with additional kwargs" do
        stream = %(<turbo-stream action="reload" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reload(something: "else")
      end
    end
  end
end
