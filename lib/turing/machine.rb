require 'turing/machine/head'
require 'turing/machine/configuration_list'

module Turing
  class Machine
    attr_reader :configuration_list, :current_state, :head

    def initialize
      @current_state = :b # for begin
      @configuration_list = Turing::Machine::ConfigurationList.new
      @head = Turing::Machine::Head.new
    end

    def current_configuration
      @configuration_list.get(@current_state, @head.read)
    end
  end
end
