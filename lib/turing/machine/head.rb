require 'turing/machine/tape'

module Turing
  class Machine
    class Head
      attr_reader :tape, :position

      def initialize
        @tape = Turing::Machine::Tape.new
        @position = 0
      end

      def read
        @tape[@position]
      end

      def write(entity)
        @tape[@position] = entity
      end

      def erase
        write nil
      end

      def right; @position += 1 end
      def left;  @position -= 1 end
    end
  end
end
