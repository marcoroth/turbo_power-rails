# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class TextContentTest < StreamHelperTestCase
      test "text_content" do
        stream = %(<turbo-stream targets="#input" action="text_content" text="Text Content"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.text_content("#input", "Text Content")
      end

      test "text_content with targets and html as kwargs" do
        stream = %(<turbo-stream targets="#input" action="text_content" text="Text Content"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.text_content(targets: "#input", text: "Text Content")
      end

      test "text_content with target and html as kwargs" do
        stream = %(<turbo-stream target="input" action="text_content" text="Text Content"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.text_content(target: "input", text: "Text Content")
      end

      test "text_content with html and targets as kwargs" do
        stream = %(<turbo-stream targets="#input" action="text_content" text="Text Content"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.text_content(text: "Text Content", targets: "#input")
      end

      test "text_content with targets as positional arg and html as kwarg" do
        stream = %(<turbo-stream targets="#input" action="text_content" text="Text Content"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.text_content("#input", text: "Text Content")
      end

      test "text_content with targets/html as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="text_content" text="Better Text Content"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.text_content("#input", "Text Content", targets: "#better-input", text: "Better Text Content")
      end

      test "text_content with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="text_content" text="Text Content" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.text_content("#input", text: "Text Content", something: "else")
      end
    end
  end
end
