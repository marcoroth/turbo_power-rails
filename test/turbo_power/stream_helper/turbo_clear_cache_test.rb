# frozen_string_literal: true

require "test_helper"

module TurboPower
  module StreamHelper
    class TurboClearCacheTest < StreamHelperTestCase
      test "turbo_clear_cache" do
        stream = %(<turbo-stream action="turbo_clear_cache"><template></template></turbo-stream>)

        assert_dom_equal stream, turbo_stream.turbo_clear_cache
      end
    end
  end
end
