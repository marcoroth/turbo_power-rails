# frozen_string_literal: true

require "test_helper"

module TurboPower
  class StreamHelperTest < ActionView::TestCase
    include TurboStreamHelpers
    include Turbo::Streams::ActionHelper

    test "dispatch_event" do
      stream = %(<turbo-stream name="custom-event" action="dispatch_event" targets="#element"><template>{"count":1,"type":"custom","enabled":true,"ids":[1,2,3]}</template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.dispatch_event("#element", "custom-event", detail: { count: 1, type: "custom", enabled: true, ids: [1, 2, 3] })
    end
  end
end
