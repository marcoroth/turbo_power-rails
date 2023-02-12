# frozen_string_literal: true

require "test_helper"

module TurboPower
  class AttributeTransformationsTest < ActionView::TestCase
    include AttributeTransformations

    test "transform keys" do
      expected = {
        "some-key": "one",
        "another-key": "two",
        "a-third-key": "three"
      }

      assert_equal expected, transform_attributes(someKey: "one", another_key: "two", "a-third-key" => "three")
    end

    test "transform values" do
      expected = {
        one: "true",
        two: "false",
        three: "",
        four: "",
        five: "string",
        six: "{}",
        seven: "{\"key\":\"value\"}",
        eight: "[]",
        nine: "[{\"one\":\"key\",\"two\":\"value\"}]"
      }

      assert_equal expected, transform_attributes(
        one: true,
        two: false,
        three: nil,
        four: "",
        five: "string",
        six: {},
        seven: { key: "value" },
        eight: [],
        nine: [{ one: "key", two: "value" }]
      )
    end
  end
end
