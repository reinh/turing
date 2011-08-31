require 'turing/machine/head'
require 'turing/machine/configuration_list'

module Turing
  class Machine
    attr_reader :configuration_list, :head

    def initialize
      @configuration_list = Turing::Machine::ConfigurationList.new
      @head = Turing::Machine::Head.new
    end
  end
end
