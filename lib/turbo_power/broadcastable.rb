# frozen_string_literal: true

module TurboPower
  module Broadcastable
    ACTIONS = TurboPower::StreamHelper.instance_methods.sort

    ACTIONS.each do |action|
      action_name = "broadcast_#{action}"
      action_name_to = "broadcast_#{action}_to"
      action_name_later = "broadcast_#{action}_later"
      action_name_later_to = "broadcast_#{action}_later_to"

      define_method(action_name) do |**attributes|
        Turbo::StreamsChannel.send(action_name_to, self, action: action, **attributes)
      end

      define_method(action_name_to) do |*streamables, **attributes|
        Turbo::StreamsChannel.send(action_name_to, *streamables, action: action, **attributes)
      end

      define_method(action_name_later) do |**attributes|
        Turbo::StreamsChannel.send(action_name_later_to, self, action: action, **attributes)
      end

      define_method(action_name_later_to) do |*streamables, **attributes|
        Turbo::StreamsChannel.send(action_name_later_to, *streamables, action: action, **attributes)
      end
    end
  end
end
