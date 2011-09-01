require 'turing/machine/head'
require 'turing/machine/configuration_list'

module Turing
  class Machine
    class Error < StandardError; end
    class UnsatisfactoryError < Error; end

    def self.build(str)
      configurations = Turing::Parser.parse(str)
      Turing::Machine.new(configurations)
    end

    attr_reader :configuration_list, :current_state, :head

    def initialize(configurations=[])
      @current_state = :b # for begin
      @configuration_list = Turing::Machine::ConfigurationList.new
      @head = Turing::Machine::Head.new

      # If configurations is an array of Configuration structs, * will still
      # unpack it properly
      configurations.each{|c| @configuration_list.add *c}
    end

    def current_configuration
      @configuration_list.get(@current_state, @head.read)
    end

    def step
      unless config = current_configuration
        raise Turing::Machine::UnsatisfactoryError, "No configuration matches current state #{current_state.inspect} and tape symbol #{@head.read.inspect}"
      end

      config.actions.each do |action|
        case action.first
        when :write then head.write action.last
        when :erase then head.erase
        when :right then head.right
        when :left  then head.left
        end
      end

      @current_state = config.next_state
    end

    def ==(other)
      [configuration_list, current_state, head.position, head.tape] == 
        [other.configuration_list, other.current_state, other.head.position, other.head.tape]
    end
  end
end
