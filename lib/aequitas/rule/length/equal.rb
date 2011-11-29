# -*- encoding: utf-8 -*-

require 'aequitas/rule/length'

module Aequitas
  class Rule
    module Length
      class Equal < Rule

        include Length

        attr_reader :expected

        def initialize(attribute_name, options)
          super

          @expected = options.fetch(:expected)
        end

        def violation_type(resource)
          :wrong_length
        end

        def violation_data(resource)
          [ [ :expected, expected ] ]
        end

      private

        # Validate the value length is equal to the expected length
        #
        # @param [Integer] length
        #   the value length
        #
        # @return [String, nil]
        #   the error message if invalid, nil if not
        #
        # @api private
        def valid_length?(length)
          expected == length
        end

      end # class Equal
    end # module Length
  end # class Rule
end # module Aequitas
