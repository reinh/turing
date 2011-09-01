require 'turing/machine/configuration'

module Turing
  class Machine
    # The ConfigurationList holds the list of configurations for the machine.
    # This list, combined with the current configuration and current tape
    # position, represents the "complete configuration" of the machine.
    class ConfigurationList
      def initialize
        @list = {}
      end

      def add(label, symbol, actions, next_state)
        if action = actions.map{|a| a.first}.detect{|a| not [:right, :left, :write, :erase].include?(a) }
          raise Turing::Machine::Error.new "Unable to add configuration with invalid action #{action.inspect}"
        end

        Configuration.new(label, symbol, actions, next_state).tap do |config|
          @list[label] ||= {}
          @list[label][symbol] = config
        end
      end

      def get(label, symbol)
        @list[label] && @list[label][symbol]
      end

      def ==(other)
        list == other.list
      end

      protected

      attr_reader :list
    end
  end
end
