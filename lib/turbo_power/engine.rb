# frozen_string_literal: true

require "rails/engine"

module TurboPower
  class Engine < Rails::Engine
    initializer "turbo_power.helpers", after: :initialize do
      Turbo::Streams::TagBuilder.include(TurboPower::StreamHelper)
    end

    # If you don't want to precompile TurboPower's assets (eg. because you're using webpack
    # or esbuild), you can do this in an initializer:
    #
    # config.after_initialize do
    #   config.assets.precompile -= TurboPower::Engine::PRECOMPILE_ASSETS
    # end
    PRECOMPILE_ASSETS = ["turbo_power.js", "turbo_power.min.js", "turbo_power.min.js.map"]

    initializer "turbo_power.assets" do
      if Rails.application.config.respond_to?(:assets)
        Rails.application.config.assets.precompile += PRECOMPILE_ASSETS
      end
    end
  end
end
