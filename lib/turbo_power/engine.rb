# frozen_string_literal: true

require "rails/engine"

module TurboPower
  class Engine < Rails::Engine
    initializer "turbo_power.stream_helpers", after: :initialize do
      Turbo::Streams::TagBuilder.include(TurboPower::StreamHelper)
    end

    initializer "turbo_power.broadcasts", after: :initialize do
      Turbo::Streams::Broadcasts.include(TurboPower::Broadcasts)
    end

    initializer "turbo_power.broadcastable", after: :initialize do
      Turbo::Broadcastable.include(TurboPower::Broadcastable)
    end
  end
end
