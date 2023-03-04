# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class InsertAdjacentHTMLTest < StreamHelperTestCase
      test "insert_adjacent_html" do
        stream = %(<turbo-stream action="insert_adjacent_html" targets="#element" position="beforeend"><template><p>Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html("#element", "<p>Adjacent HTML</p>")
      end

      test "insert_adjacent_html with position" do
        stream = %(<turbo-stream action="insert_adjacent_html" targets="#element" position="afterbegin"><template><p>Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html("#element", "<p>Adjacent HTML</p>", position: "afterbegin")
      end

      test "insert_adjacent_html with html as kwarg" do
        stream = %(<turbo-stream action="insert_adjacent_html" targets="#element" position="beforeend"><template><p>Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html("#element", html: "<p>Adjacent HTML</p>")
      end

      test "insert_adjacent_html with targets and html as kwarg" do
        stream = %(<turbo-stream action="insert_adjacent_html" targets="#element" position="beforeend"><template><p>Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html(targets: "#element", html: "<p>Adjacent HTML</p>")
      end

      test "insert_adjacent_html with target and html as kwarg" do
        stream = %(<turbo-stream action="insert_adjacent_html" target="element" position="beforeend"><template><p>Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html(target: "element", html: "<p>Adjacent HTML</p>")
      end

      test "insert_adjacent_html with targets, html and position as kwargs" do
        stream = %(<turbo-stream action="insert_adjacent_html" targets="#element" position="afterbegin"><template><p>Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html(targets: "#element", html: "<p>Adjacent HTML</p>", position: "afterbegin")
      end

      test "insert_adjacent_html with targets, html as args/kwargs and position as kwargs" do
        stream = %(<turbo-stream action="insert_adjacent_html" targets="#better-element" position="afterbegin"><template><p>Better Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html("#element", "<p>Adjacent HTML</p>", targets: "#better-element", html: "<p>Better Adjacent HTML</p>", position: "afterbegin")
      end

      test "insert_adjacent_html with additional attributes" do
        stream = %(<turbo-stream action="insert_adjacent_html" targets="#element" position="beforeend" something="else"><template><p>Adjacent HTML</p></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.insert_adjacent_html("#element", html: "<p>Adjacent HTML</p>", something: "else")
      end
    end
  end
end
