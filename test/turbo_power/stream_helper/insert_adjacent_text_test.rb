# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class InsertAdjacentTextTest < StreamHelperTestCase
      test "insert_adjacent_text" do
        stream = %(<turbo-stream action="insert_adjacent_text" targets="#element" position="beforebegin" text="Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text("#element", "Adjacent Text")
      end

      test "insert_adjacent_text with position" do
        stream = %(<turbo-stream action="insert_adjacent_text" targets="#element" position="afterbegin" text="Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text("#element", "Adjacent Text", position: "afterbegin")
      end

      test "insert_adjacent_text with text as kwarg" do
        stream = %(<turbo-stream action="insert_adjacent_text" targets="#element" position="beforebegin" text="Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text("#element", text: "Adjacent Text")
      end

      test "insert_adjacent_text with targets and text as kwarg" do
        stream = %(<turbo-stream action="insert_adjacent_text" targets="#element" position="beforebegin" text="Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text(targets: "#element", text: "Adjacent Text")
      end

      test "insert_adjacent_text with target and text as kwarg" do
        stream = %(<turbo-stream action="insert_adjacent_text" target="element" position="beforebegin" text="Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text(target: "element", text: "Adjacent Text")
      end

      test "insert_adjacent_text with targets, text and position as kwargs" do
        stream = %(<turbo-stream action="insert_adjacent_text" targets="#element" position="afterbegin" text="Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text(targets: "#element", text: "Adjacent Text", position: "afterbegin")
      end

      test "insert_adjacent_text with targets, text as args/kwargs and position as kwargs" do
        stream = %(<turbo-stream action="insert_adjacent_text" targets="#better-element" position="afterbegin" text="Better Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text("#element", "Adjacent Text", targets: "#better-element", text: "Better Adjacent Text", position: "afterbegin")
      end

      test "insert_adjacent_text with additional attributes" do
        stream = %(<turbo-stream action="insert_adjacent_text" targets="#element" position="beforebegin" something="else" text="Adjacent Text"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_text("#element", text: "Adjacent Text", something: "else")
      end
    end
  end
end
