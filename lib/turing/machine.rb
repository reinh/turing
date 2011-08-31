require 'turing/machine/head'
require 'turing/machine/configuration_list'

module Turing
  class Machine
    class Error < StandardError; end
    class UnsatisfactoryError < Error; end

    attr_reader :configuration_list, :current_state, :head

    def initialize
      @current_state = :b # for begin
      @configuration_list = Turing::Machine::ConfigurationList.new
      @head = Turing::Machine::Head.new
    end

    def current_configuration
      @configuration_list.get(@current_state, @head.read)
    end

    def step
      unless current_configuration
        raise Turing::Machine::UnsatisfactoryError, "No configuration matches current state #{current_state.inspect} and tape symbol #{@head.read.inspect}"
      end

      current_configuration.actions.each do |action|
        case action.first
        when :write then head.write action.last
        when :erase then head.erase
        when :right then head.right
        when :left  then head.left
        end
      end

    end
  end
end
