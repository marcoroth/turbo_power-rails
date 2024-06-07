# frozen_string_literal: true

module TurboPower
  module Broadcasts
    ACTIONS = TurboPower::StreamHelper.instance_methods.sort

    ACTIONS.each do |action|
      define_method("broadcast_#{action}_to") do |*streamables, **attributes|
        custom_broadcast_action_to(*streamables, action: action, **attributes)
      end

      define_method("broadcast_#{action}_later_to") do |*streamables, **attributes|
        custom_broadcast_action_later_to(*streamables, action: action, **attributes)
      end
    end

    def custom_broadcast_action_to(*streamables, action:, **attributes)
      broadcast_stream_to(
        *streamables,
        content: RenderHelper.public_send(action, **attributes)
      )
    end

    def custom_broadcast_action_later_to(*streamables, action:, **attributes)
      TurboPower::Streams::ActionBroadcastJob.perform_later(
        stream_name_from(streamables),
        action: action,
        **attributes
      )
    end
  end
end
