# frozen_string_literal: true

require "test_helper"

module TurboPower
  class BroadcastableTest < ActionCable::Channel::TestCase
    include Turbo::Broadcastable::TestHelper

    test "broadcast_dispatch_event" do
      message = Message.new(id: 1)

      detail = { id: message.id, action: "save" }
      message.broadcast_dispatch_event(target: dom_id(message), name: "saved", detail: detail)

      streams = capture_turbo_stream_broadcasts(message)

      assert_equal 1, streams.length
      assert_equal "message_1", streams.first["target"]
      assert_equal "dispatch_event", streams.first["action"]

      template_content = detail.to_json
      assert_equal template_content, streams.first.at_css("template").content
    end

    test "broadcast_dispatch_event_to" do
      message = Message.new(id: 1)

      detail = { id: message.id, action: "save" }
      message.broadcast_dispatch_event_to("messages", target: dom_id(message), name: "saved", detail: detail)

      streams = capture_turbo_stream_broadcasts("messages")

      assert_equal 1, streams.length
      assert_equal "message_1", streams.first["target"]
      assert_equal "dispatch_event", streams.first["action"]

      template_content = detail.to_json
      assert_equal template_content, streams.first.at_css("template").content
    end
  end
end
