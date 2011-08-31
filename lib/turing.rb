module Turing
  class Head
    attr_reader :head, :position

    def initialize
      @tape = Turing::Tape.new
      @position = 0
    end

    def read; 
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

  class Tape < Array
    def inspect
      "<#{self.class.name}>#{super}"
    end

    def to_s
      map{|e| e || '_'}.join
    end
  end
end
