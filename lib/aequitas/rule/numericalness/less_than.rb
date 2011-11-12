# -*- encoding: utf-8 -*-

require 'aequitas/rule/numericalness'

module Aequitas
    class Rule
      module Numericalness

        class LessThan < Rule

          include Numericalness

          def valid_numericalness?(value)
            value < expected
          rescue ArgumentError
            # TODO: figure out better solution for: can't compare String with Integer
            true
          end

          def violation_type(resource)
            :less_than
          end

          def violation_data(resource)
            [ [ :maximum, expected ] ]
          end

        end # class LessThan

      end # module Numericalness
    end # class Rule
end # module Aequitas
