require 'turing/machine/configuration'

module Turing
  class Machine
    # The ConfigurationList holds the list of configurations for the machine.
    # This list, combined with the current tape position, represents the
    # "complete configuration" of the machine.
    class ConfigurationList
      def add(label, symbol, actions, next_state)
        Configuration.new(label, symbol, actions, next_state)
      end
    end
  end
end
