# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class OuterHTMLTest < StreamHelperTestCase
      test "outer_html" do
        stream = %(<turbo-stream targets="#input" action="outer_html"><template><p>Outer HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.outer_html("#input", "<p>Outer HTML</p>")
      end

      test "outer_html with targets and html as kwargs" do
        stream = %(<turbo-stream targets="#input" action="outer_html"><template><p>Outer HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.outer_html(targets: "#input", html: "<p>Outer HTML</p>")
      end

      test "outer_html with target and html as kwargs" do
        stream = %(<turbo-stream target="input" action="outer_html"><template><p>Outer HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.outer_html(target: "input", html: "<p>Outer HTML</p>")
      end

      test "outer_html with html and targets as kwargs" do
        stream = %(<turbo-stream targets="#input" action="outer_html"><template><p>Outer HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.outer_html(html: "<p>Outer HTML</p>", targets: "#input")
      end

      test "outer_html with targets as positional arg and html as kwarg" do
        stream = %(<turbo-stream targets="#input" action="outer_html"><template><p>Outer HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.outer_html("#input", html: "<p>Outer HTML</p>")
      end

      test "outer_html with targets/html as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="outer_html"><template><p>Better Outer HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.outer_html("#input", "<p>Outer HTML</p>", targets: "#better-input", html: "<p>Better Outer HTML</p>")
      end

      test "outer_html with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="outer_html" something="else"><template><p>Outer HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.outer_html("#input", html: "<p>Outer HTML</p>", something: "else")
      end
    end
  end
end
