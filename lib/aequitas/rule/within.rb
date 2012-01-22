# -*- encoding: utf-8 -*-

require 'aequitas/rule'

module Aequitas
  class Rule
    class Within < Rule

      equalize_on *superclass.equalizer.keys + [:set]

      attr_reader :set

      def initialize(attribute_name, options={})
        super

        @set = options.fetch(:set)
      end

      def valid_value?(value)
        skip?(value) || set.include?(value)
      end

      def violation_type
        :inclusion
      end

      def violation_data(resource)
        [ [ :set, set.to_a.join(', ') ] ]
      end

    end # class Within
  end # class Rule
end # module Aequitas
