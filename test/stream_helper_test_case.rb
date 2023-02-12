# frozen_string_literal: true

require "test_helper"

module TurboPower
  class StreamHelperTestCase < ActionView::TestCase
    include TurboStreamHelpers
    include Turbo::Streams::ActionHelper
  end
end
