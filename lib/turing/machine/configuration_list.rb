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
        Configuration.new(label, symbol, actions, next_state).tap do |config|
          @list[label] ||= {}
          @list[label][symbol] = config
        end
      end
      alias :<< :add

      def get(label, symbol)
        @list[label] && @list[label][symbol]
      end
      alias :[] :get
    end
  end
end
