# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class RedirectToTest < StreamHelperTestCase
      test "redirect_to default" do
        stream = %(<turbo-stream action="redirect_to" turbo-action="advance" url="http://localhost:8080"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080")
      end

      test "redirect_to with turbo=false" do
        stream = %(<turbo-stream turbo="false" turbo-action="advance" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", turbo: false)
      end

      test "redirect_to with turbo_action=replace" do
        stream = %(<turbo-stream turbo-action="replace" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", "replace")
      end

      test "redirect_to with turbo_action=replace kwarg" do
        stream = %(<turbo-stream turbo-action="replace" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", turbo_action: "replace")
      end

      test "redirect_to with turbo_action=replace and turbo_frame=modals as positional arguments" do
        stream = %(<turbo-stream turbo-action="replace" turbo-frame="modals" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", "replace", "modals")
      end

      test "redirect_to with turbo_action=replace as positional argument and turbo_frame=modals as kwarg" do
        stream = %(<turbo-stream turbo-action="replace" turbo-frame="modals" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", "replace", turbo_frame: "modals")
      end

      test "redirect_to with turbo_action=replace and turbo_frame=modals as kwarg" do
        stream = %(<turbo-stream turbo-action="replace" turbo-frame="modals" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", turbo_action: "replace", turbo_frame: "modals")
      end

      test "redirect_to all kwargs" do
        stream = %(<turbo-stream turbo-action="replace" turbo-frame="modals" turbo="true" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to(url: "http://localhost:8080", turbo_action: "replace", turbo_frame: "modals", turbo: true)
      end
    end
  end
end
