# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class SetMetaTest < StreamHelperTestCase
      test "set_meta" do
        stream = %(<turbo-stream action="set_meta" name="viewport" content="initial-scale=1.0"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_meta("viewport", "initial-scale=1.0")
      end

      test "set_meta with name and html as kwargs" do
        stream = %(<turbo-stream action="set_meta" name="viewport" content="initial-scale=1.0"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_meta(name: "viewport", content: "initial-scale=1.0")
      end

      test "set_meta with html and name as kwargs" do
        stream = %(<turbo-stream action="set_meta" name="viewport" content="initial-scale=1.0"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_meta(content: "initial-scale=1.0", name: "viewport")
      end

      test "set_meta with name as positional arg and html as kwarg" do
        stream = %(<turbo-stream action="set_meta" name="viewport" content="initial-scale=1.0"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_meta("viewport", content: "initial-scale=1.0")
      end

      test "set_meta with name/html as positional arg and kwarg" do
        stream = %(<turbo-stream action="set_meta" name="better-viewport" action="set_meta" content="better-initial-scale=2.0"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_meta("viewport", "initial-scale=1.0", name: "better-viewport", content: "better-initial-scale=2.0")
      end

      test "set_meta with additional arguments" do
        stream = %(<turbo-stream action="set_meta" name="viewport" content="initial-scale=1.0" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.set_meta("viewport", content: "initial-scale=1.0", something: "else")
      end
    end
  end
end
