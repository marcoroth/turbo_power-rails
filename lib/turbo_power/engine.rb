require "rails/engine"

module TurboPower
  class Engine < Rails::Engine
    initializer "turbo_power.helpers", after: :initialize do |app|
      Turbo::Streams::TagBuilder.include(TurboPower::StreamHelper)
    end
  end
end
