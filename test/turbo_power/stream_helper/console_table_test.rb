# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class ConsoleTableTest < StreamHelperTestCase
      fruits = ["apples", "oranges", "bananas"]
      persons = [
        { firstName: "Tyrone", lastName: "Jones" },
        { firstName: "Janet", lastName: "Smith" },
      ]

      test "console_table with no args" do
        stream = %(<turbo-stream data="[]" columns="[]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table
      end

      test "console_table with array of strings in data" do
        stream = %(<turbo-stream data="[&quot;apples&quot;,&quot;oranges&quot;,&quot;bananas&quot;]" columns="[]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(fruits)
      end

      test "console_table with array of objects in data" do
        stream = %(<turbo-stream data="[{&quot;firstName&quot;:&quot;Tyrone&quot;,&quot;lastName&quot;:&quot;Jones&quot;},{&quot;firstName&quot;:&quot;Janet&quot;,&quot;lastName&quot;:&quot;Smith&quot;}]" columns="[]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(persons)
      end

      test "console_table with array of objects in data and columns" do
        stream = %(<turbo-stream columns="[&quot;firstName&quot;]" data="[{&quot;firstName&quot;:&quot;Tyrone&quot;,&quot;lastName&quot;:&quot;Jones&quot;},{&quot;firstName&quot;:&quot;Janet&quot;,&quot;lastName&quot;:&quot;Smith&quot;}]" columns="[]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(persons, [:firstName])
      end

      test "console_table with data as kwarg" do
        stream = %(<turbo-stream data="[{&quot;firstName&quot;:&quot;Tyrone&quot;,&quot;lastName&quot;:&quot;Jones&quot;},{&quot;firstName&quot;:&quot;Janet&quot;,&quot;lastName&quot;:&quot;Smith&quot;}]" columns="[]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(data: persons)
      end

      test "console_table with data and columns as kwargs" do
        stream = %(<turbo-stream columns="[&quot;firstName&quot;]" data="[{&quot;firstName&quot;:&quot;Tyrone&quot;,&quot;lastName&quot;:&quot;Jones&quot;},{&quot;firstName&quot;:&quot;Janet&quot;,&quot;lastName&quot;:&quot;Smith&quot;}]" columns="[]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(data: persons, columns: [:firstName])
      end

      test "console_table with data as positional arg and columns as kwarg" do
        stream = %(<turbo-stream columns="[&quot;firstName&quot;]" data="[{&quot;firstName&quot;:&quot;Tyrone&quot;,&quot;lastName&quot;:&quot;Jones&quot;},{&quot;firstName&quot;:&quot;Janet&quot;,&quot;lastName&quot;:&quot;Smith&quot;}]" columns="[]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(persons, columns: [:firstName])
      end

      test "console_table with data/columns as positional arg and kwarg" do
        stream = %(<turbo-stream data="[&quot;apples&quot;,&quot;oranges&quot;,&quot;bananas&quot;]" columns="[1]" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(persons, [:firstName], data: fruits, columns: [1])
      end

      test "console_table with additional arguments" do
        stream = %(<turbo-stream data="[&quot;apples&quot;,&quot;oranges&quot;,&quot;bananas&quot;]" columns="[]" something="else" action="console_table"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.console_table(fruits, columns: [], something: "else")
      end
    end
  end
end
