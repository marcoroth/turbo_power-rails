# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ResetFormTest < StreamHelperTestCase
      test "reset_form" do
        stream = %(<turbo-stream targets="#form" action="reset_form"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reset_form("#form")
      end

      test "reset_form with targets as kwarg" do
        stream = %(<turbo-stream targets="#form" action="reset_form"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reset_form(targets: "#form")
      end

      test "reset_form with target as kwarg" do
        stream = %(<turbo-stream target="form" action="reset_form"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reset_form(target: "form")
      end

      test "reset_form with targets as arg and kwarg" do
        stream = %(<turbo-stream targets="#better-form" action="reset_form"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reset_form("#form", targets: "#better-form")
      end

      test "reset_form with additional arguments" do
        stream = %(<turbo-stream targets="#form" something="else" action="reset_form"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.reset_form("#form", something: "else")
      end
    end
  end
end
