# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class MorphTest < StreamHelperTestCase
      test "morph" do
        stream = %(<turbo-stream targets="#input" action="morph"><template><p>Morph</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.morph("#input", "<p>Morph</p>")
      end

      test "morph with targets and html as kwargs" do
        stream = %(<turbo-stream targets="#input" action="morph"><template><p>Morph</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.morph(targets: "#input", html: "<p>Morph</p>")
      end

      test "morph with target and html as kwargs" do
        stream = %(<turbo-stream target="input" action="morph"><template><p>Morph</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.morph(target: "input", html: "<p>Morph</p>")
      end

      test "morph with html and targets as kwargs" do
        stream = %(<turbo-stream targets="#input" action="morph"><template><p>Morph</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.morph(html: "<p>Morph</p>", targets: "#input")
      end

      test "morph with targets as positional arg and html as kwarg" do
        stream = %(<turbo-stream targets="#input" action="morph"><template><p>Morph</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.morph("#input", html: "<p>Morph</p>")
      end

      test "morph with targets/html as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="morph"><template><p>Better Morph</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.morph("#input", "<p>Morph</p>", targets: "#better-input", html: "<p>Better Morph</p>")
      end

      test "morph with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="morph" something="else"><template><p>Morph</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.morph("#input", html: "<p>Morph</p>", something: "else")
      end
    end
  end
end
