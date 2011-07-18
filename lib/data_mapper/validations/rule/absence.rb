# -*- encoding: utf-8 -*-

require 'data_mapper/validations/rule'

module DataMapper
  module Validations
    class Rule

      class Absence < Rule

        def initialize(attribute_name, options = {})
          super

          @allow_nil   = false
          @allow_blank = false
        end

        def valid?(resource)
          value = resource.validation_property_value(attribute_name)
          DataMapper::Ext.blank?(value)
        end

        def violation_type(resource)
          :absent
        end

      end # class Absence

    end # class Rule
  end # module Validations
end # module DataMapper
