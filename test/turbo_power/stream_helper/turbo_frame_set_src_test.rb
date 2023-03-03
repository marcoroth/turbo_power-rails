# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class TurboFrameSetSrcTest < StreamHelperTestCase
      test "turbo_frame_set_src" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_set_src" src="/users"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_set_src("user_1", "/users")
      end

      test "turbo_frame_set_src with src kwarg" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_set_src" src="/users"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_set_src("user_1", src: "/users")
      end

      test "turbo_frame_set_src with target and src kwarg" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_set_src" src="/users"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_set_src(target: "user_1", src: "/users")
      end

      test "turbo_frame_set_src with src and target kwarg" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_set_src" src="/users"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_set_src(src: "/users", target: "user_1")
      end

      test "turbo_frame_set_src with targets and src kwarg" do
        stream = %(<turbo-stream targets="#user_1" action="turbo_frame_set_src" src="/users"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_set_src(targets: "#user_1", src: "/users")
      end

      test "turbo_frame_set_src additional attribute" do
        stream = %(<turbo-stream target="user_1" action="turbo_frame_set_src" src="/users" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_frame_set_src("user_1", src: "/users", something: "else")
      end
    end
  end
end
