# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class GraftTest < StreamHelperTestCase
      test "graft" do
        stream = %(<turbo-stream targets="#input" action="graft" parent="#parent"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.graft("#input", "#parent")
      end

      test "graft with targets and html as kwargs" do
        stream = %(<turbo-stream targets="#input" action="graft" parent="#parent"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.graft(targets: "#input", parent: "#parent")
      end

      test "graft with target and html as kwargs" do
        stream = %(<turbo-stream target="input" action="graft" parent="#parent"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.graft(target: "input", parent: "#parent")
      end

      test "graft with html and targets as kwargs" do
        stream = %(<turbo-stream targets="#input" action="graft" parent="#parent"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.graft(parent: "#parent", targets: "#input")
      end

      test "graft with targets as positional arg and html as kwarg" do
        stream = %(<turbo-stream targets="#input" action="graft" parent="#parent"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.graft("#input", parent: "#parent")
      end

      test "graft with targets/html as positional arg and kwarg" do
        stream = %(<turbo-stream targets="#better-input" action="graft" parent="#better-parent"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.graft("#input", "#parent", targets: "#better-input", parent: "#better-parent")
      end

      test "graft with additional arguments" do
        stream = %(<turbo-stream targets="#input" action="graft" parent="#parent" something="else"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.graft("#input", parent: "#parent", something: "else")
      end
    end
  end
end
