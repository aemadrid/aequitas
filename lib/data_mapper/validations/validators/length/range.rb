# -*- encoding: utf-8 -*-

require 'data_mapper/validations/validators/length'

module DataMapper
  module Validations
    module Validators
      module Length

        class Range < Validator

          include Length

          attr_reader :expected

          def initialize(attribute_name, options)
            @expected = options[:range]
            # super(attribute_name, DataMapper::Ext::Hash.except(options, :range))
            super
          end

          def error_message_args
            [ :length_between, humanized_field_name, expected.min, expected.max ]
          end

        private

          # Validate the value length is within expected range
          #
          # @param [Integer] length
          #   the value length
          #
          # @return [String, NilClass]
          #   the error message if invalid, nil if valid
          #
          # @api private
          def validate_length(length)
            expected.include?(length)
          end

        end # class Range

      end # module Length
    end # module Validators
  end # module Validations
end # module DataMapper
