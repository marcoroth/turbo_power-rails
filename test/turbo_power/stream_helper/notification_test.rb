# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class NotificationTest < StreamHelperTestCase
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
    end
  end
end
