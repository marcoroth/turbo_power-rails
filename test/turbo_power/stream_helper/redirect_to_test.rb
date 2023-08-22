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

      test "redirect_to with action=replace" do
        stream = %(<turbo-stream turbo-action="replace" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", "replace")
      end

      test "redirect_to with turbo_action=replace kwarg" do
        stream = %(<turbo-stream turbo-action="replace" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", turbo_action: "replace")
      end

      test "redirect_to all kwargs" do
        stream = %(<turbo-stream turbo-action="replace" turbo="true" url="http://localhost:8080" action="redirect_to"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to(url: "http://localhost:8080", turbo_action: "replace", turbo: true)
      end

      test "redirect_to default" do
        stream = %(<turbo-stream action="redirect_to" turbo-action="advance" turbo-frame="modals" url="http://localhost:8080"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.redirect_to("http://localhost:8080", turbo_frame: "modals")
      end
    end
  end
end
