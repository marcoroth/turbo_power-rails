# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class DispatchEventTest < StreamHelperTestCase
      test "dispatch_event" do
        stream = %(<turbo-stream name="custom-event" action="dispatch_event" targets="#element"><template>{}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event("#element", "custom-event")
      end

      test "dispatch_event with detail" do
        stream = %(<turbo-stream name="custom-event" action="dispatch_event" targets="#element"><template>{"count":1,"type":"custom","enabled":true,"ids":[1,2,3]}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event("#element", "custom-event", detail: { count: 1, type: "custom", enabled: true, ids: [1, 2, 3] })
      end

      test "dispatch_event with name as kwarg" do
        stream = %(<turbo-stream name="custom-event" action="dispatch_event" targets="#element"><template>{}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event("#element", name: "custom-event")
      end

      test "dispatch_event with targets and name as kwarg" do
        stream = %(<turbo-stream name="custom-event" action="dispatch_event" targets="#element"><template>{}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event(targets: "#element", name: "custom-event")
      end

      test "dispatch_event with target and name as kwarg" do
        stream = %(<turbo-stream name="custom-event" action="dispatch_event" target="element"><template>{}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event(target: "element", name: "custom-event")
      end

      test "dispatch_event with targets, name and detail as kwargs" do
        stream = %(<turbo-stream name="custom-event" action="dispatch_event" targets="#element"><template>{"count":1,"type":"custom","enabled":true,"ids":[1,2,3]}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event(targets: "#element", name: "custom-event", detail: { count: 1, type: "custom", enabled: true, ids: [1, 2, 3] })
      end

      test "dispatch_event with targets and name as args and kwargs" do
        stream = %(<turbo-stream name="better-custom-event" action="dispatch_event" targets="#better-element"><template>{"count":1,"type":"custom","enabled":true,"ids":[1,2,3]}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event("#element", "custom-name", targets: "#better-element", name: "better-custom-event", detail: { count: 1, type: "custom", enabled: true, ids: [1, 2, 3] })
      end

      test "dispatch_event with additional attributes" do
        stream = %(<turbo-stream name="custom-event" action="dispatch_event" targets="#element" something="else"><template>{}</template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.dispatch_event("#element", name: "custom-event", something: "else")
      end
    end
  end
end
