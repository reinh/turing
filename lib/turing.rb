module Turing
  class Head
    attr_reader :position

    def initialize
      @position = 0
    end

    def right
      @position += 1
    end
  end
end
