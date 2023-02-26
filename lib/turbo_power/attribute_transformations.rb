# frozen_string_literal: true

module TurboPower
  module AttributeTransformations
    private

    def transform_attributes(attributes)
      attributes
        .transform_keys { |key| transform_key(key) }
        .transform_values { |value| transform_value(value) }
    end

    def transform_key(key)
      key.to_s.underscore.dasherize.to_sym
    end

    def transform_value(value)
      case value
      when String
        value
      when Symbol
        value.to_s
      when NilClass
        ""
      else
        value.to_json
      end
    end
  end
end
