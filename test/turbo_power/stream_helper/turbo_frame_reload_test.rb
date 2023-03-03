# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class TurboFrameReloadTest < StreamHelperTestCase
      test "turbo_frame_reload" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_reload"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_reload("user_1")
      end

      test "turbo_frame_reload with target kwarg" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_reload"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_reload(target: "user_1")
      end

      test "turbo_frame_reload with targets kwarg" do
        stream = %(<turbo-stream targets="#user_1" action="turbo_frame_reload"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_reload(targets: "#user_1")
      end

      test "turbo_frame_reload additional attribute" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_reload" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_reload("user_1", something: "else")
      end
    end
  end
end
