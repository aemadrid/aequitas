# -*- encoding: utf-8 -*-

require 'aequitas/rule/absence'

module Aequitas
  class Rule
    class Absence
      class Nil < Absence

        def valid?(resource)
          attribute_value(resource).nil?
        end

        def violation_type(resource)
          :not_nil
        end

      end # class Nil
    end # class Absence
  end # class Rule
end # module Aequitas