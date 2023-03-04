# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetTitleTest < StreamHelperTestCase
      test "set_title" do
        stream = %(<turbo-stream action="set_title" title="My Title"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_title("My Title")
      end

      test "set_title with kwarg" do
        stream = %(<turbo-stream action="set_title" title="My Title"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_title(title: "My Title")
      end

      test "set_title with additional kwargs" do
        stream = %(<turbo-stream action="set_title" title="My Title" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_title("My Title", something: "else")
      end
    end
  end
end
