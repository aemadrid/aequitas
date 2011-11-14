# -*- encoding: utf-8 -*-

require 'aequitas/rule/numericalness'

module Aequitas
  class Rule
    module Numericalness
      class GreaterThanOrEqual < Rule

        include Numericalness

        def valid_numericalness?(value)
          value >= expected
        rescue ArgumentError
          # TODO: figure out better solution for: can't compare String with Integer
          true
        end

        def violation_type(resource)
          :greater_than_or_equal_to
        end

        def violation_data(resource)
          [ [ :minimum, expected ] ]
        end

      end # class GreaterThanOrEqual
    end # module Numericalness
  end # class Rule
end # module Aequitas
