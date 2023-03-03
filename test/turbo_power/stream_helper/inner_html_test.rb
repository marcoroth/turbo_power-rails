# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class InnerHTMLTest < StreamHelperTestCase
      test "inner_html" do
        stream = %(<turbo-stream targets="#input" action="inner_html"><template><p>Inner HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.inner_html("#input", "<p>Inner HTML</p>")
      end

      test "inner_html with targets and html as kwargs" do
        stream = %(<turbo-stream targets="#input" action="inner_html"><template><p>Inner HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.inner_html(targets: "#input", html: "<p>Inner HTML</p>")
      end

      test "inner_html with target and html as kwargs" do
        stream = %(<turbo-stream target="input" action="inner_html"><template><p>Inner HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.inner_html(target: "input", html: "<p>Inner HTML</p>")
      end

      test "inner_html with html and targets as kwargs" do
        stream = %(<turbo-stream targets="#input" action="inner_html"><template><p>Inner HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.inner_html(html: "<p>Inner HTML</p>", targets: "#input")
      end

      test "inner_html with targets as positional arg and html as kwarg" do
        stream = %(<turbo-stream targets="#input" action="inner_html"><template><p>Inner HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.inner_html("#input", html: "<p>Inner HTML</p>")
      end

      test "inner_html with targets/html as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="inner_html"><template><p>Better Inner HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.inner_html("#input", "<p>Inner HTML</p>", targets: "#better-input", html: "<p>Better Inner HTML</p>")
      end

      test "inner_html with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="inner_html" something="else"><template><p>Inner HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.inner_html("#input", html: "<p>Inner HTML</p>", something: "else")
      end
    end
  end
end
