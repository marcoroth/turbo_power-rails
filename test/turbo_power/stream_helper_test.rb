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

    test "morph" do
      stream = %(<turbo-stream action="morph" targets="#element"><template><h1>Hello</h1></template></turbo-stream>)

      assert_dom_equal stream, TurboPower::StreamHelperClass.morph(target: "#element", content: "<h1>Hello</h1>")
    end


    test "morph block" do
      stream = %(<turbo-stream action="morph" targets="#element"><template><h1>Hello</h1></template></turbo-stream>)

      actual = TurboPower::StreamHelperClass.morph(target: "#element") do
        "<h1>Hello</h1>"
      end

      assert_dom_equal stream, actual
    end

    test "console_log" do
      stream = %(<turbo-stream action="console_log" level="log" message="Message"></turbo-stream>)

      assert_dom_equal stream, TurboPower::StreamHelperClass.console_log(message: "Message")
    end

    test "reset_form" do
      stream = %(<turbo-stream action="reset_form" targets="#form"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.reset_form("#form")
    end

    test "render" do
      stream = %(<turbo-stream action="console_log" message="hello" level="log"></turbo-stream><turbo-stream action="morph" targets="#hello"><template>hello world</template></turbo-stream>)

      rendered = TurboPower::StreamsBuilder.render do |turbo_stream|
        turbo_stream.console_log(message: "hello")
        turbo_stream.morph(target: "#hello", content: "hello world")
      end

      assert_dom_equal stream, rendered
    end
  end
end
