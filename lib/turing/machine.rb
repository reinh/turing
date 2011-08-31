require 'turing/machine/head'

module Turing
  class Machine
    attr_reader :head

    def initialize
      @head = Turing::Machine::Head.new
    end
  end
end
