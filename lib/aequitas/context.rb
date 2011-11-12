# -*- encoding: utf-8 -*-

module Aequitas
    module Context
      # Module with validation context functionality.
      #
      # Contexts are implemented using a thread-local array-based stack.


      # Execute a block of code within a specific validation context
      # 
      # @param [Symbol] context
      #   the context to execute the block of code within
      # 
      # @api semipublic
      def self.in_context(context)
        stack << context
        return_value = yield
      ensure
        stack.pop
        return_value
      end

      # Get the current validation context or nil (if no context is on the stack).
      # 
      # @return [Symbol, NilClass]
      #   The current validation context (for the current thread),
      #   or nil if no current context is on the stack
      def self.current
        stack.last
      end

      # Are there any contexts on the stack?
      # 
      # @return [Boolean]
      #   true/false whether there are any contexts on the context stack
      # 
      # @api semipublic
      def self.any?(&block)
        stack.any?(&block)
      end

      # The (thread-local) validation context stack
      # This allows object graphs to be saved within potentially nested contexts
      # without having to pass the validation context throughout
      # 
      # @api private
      def self.stack
        Thread.current[:dm_validations_context_stack] ||= []
      end

    end # module Context
end # module Aequitas
