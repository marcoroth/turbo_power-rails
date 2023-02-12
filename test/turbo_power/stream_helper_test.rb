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
      stream = %(<turbo-stream value="" action="turbo_progress_bar_set_value"><template></template></turbo-stream>)

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

    test "notification with just title" do
      stream = %(<turbo-stream action="notification" title="A title"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.notification("A title")
    end

    test "notification with title and option" do
      stream = %(<turbo-stream action="notification" title="A title" body="A body"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.notification("A title", body: "A body")
    end

    test "notification with title and all options" do
      stream = %(
        <turbo-stream
          title="A title"
          dir="ltr"
          lang="EN"
          badge="https://example.com/badge.png"
          body="This is displayed below the title."
          tag="Demo"
          icon="https://example.com/icon.png"
          image="https://example.com/image.png"
          data="{&quot;arbitrary&quot;:&quot;data&quot;}"
          vibrate="[200,100,200]"
          renotify="true"
          require-interaction="true"
          actions="[{&quot;action&quot;:&quot;respond&quot;,&quot;title&quot;:&quot;Please respond&quot;,&quot;icon&quot;:&quot;https://example.com/icon.png&quot;}]"
          silent="true"
          action="notification"
        ><template></template></turbo-stream>
      ).squish

      options = {
        dir: "ltr",
        lang: "EN",
        badge: "https://example.com/badge.png",
        body: "This is displayed below the title.",
        tag: "Demo",
        icon: "https://example.com/icon.png",
        image: "https://example.com/image.png",
        data: { arbitrary: "data" },
        vibrate: [200, 100, 200],
        renotify: true,
        requireInteraction: true,
        actions: [{ action: "respond", title: "Please respond", icon: "https://example.com/icon.png" }],
        silent: true
      }

      assert_dom_equal stream, turbo_stream.notification("A title", **options)
    end

    test "notification with title kwarg" do
      stream = %(<turbo-stream action="notification" title="A title"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.notification(title: "A title")
    end

    test "attributes transformation" do
      stream = %(<turbo-stream action="turbo_clear_cache" some-key="abc" another-key="abc" a-third-key="abc"><template></template></turbo-stream>)

      assert_dom_equal stream, turbo_stream.turbo_clear_cache(someKey: "abc", another_key: "abc", "a-third-key" => "abc")
    end
  end
end
