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

    test "reset_form" do
      stream = %(<turbo-stream action="reset_form" targets="#form"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.reset_form("#form")
    end

    test "turbo_progress_bar_show" do
      stream = %(<turbo-stream action="turbo_progress_bar_show"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_progress_bar_show
    end

    test "turbo_progress_bar_hide" do
      stream = %(<turbo-stream action="turbo_progress_bar_hide"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_progress_bar_hide
    end

    test "turbo_progress_bar_set_value with nil" do
      stream = %(<turbo-stream action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(nil)
    end

    test "turbo_progress_bar_set_value with zero" do
      stream = %(<turbo-stream value="0" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(0)
    end

    test "turbo_progress_bar_set_value with float" do
      stream = %(<turbo-stream value="0.5" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(0.5)
    end

    test "turbo_progress_bar_set_value with integer" do
      stream = %(<turbo-stream value="1" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_progress_bar_set_value(1)
    end

    test "redirect_to default" do
      stream = %(<turbo-stream action="redirect_to" turbo-action="advance" url="http://localhost:8080"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080")
    end

    test "redirect_to with turbo=false" do
      stream = %(<turbo-stream turbo="false" turbo-action="advance" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", turbo: false)
    end

    test "redirect_to with action=replace" do
      stream = %(<turbo-stream turbo-action="replace" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", "replace")
    end

    test "redirect_to with turbo_action=replace" do
      stream = %(<turbo-stream turbo-action="replace" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", turbo_action: "replace")
    end

    test "turbo_clear_cache" do
      stream = %(<turbo-stream action="turbo_clear_cache"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_clear_cache
    end

    test "attributes transformation" do
      stream = %(<turbo-stream action="turbo_clear_cache" some-key="abc" another-key="abc" a-third-key="abc"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_clear_cache(someKey: "abc", another_key: "abc", "a-third-key" => "abc")
    end
  end
end
