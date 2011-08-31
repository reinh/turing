module Turing
  class Tape < Array
    def inspect
      "<#{self.class.name}>#{super}"
    end

    def to_s
      map{|e| e || '_'}.join
    end
  end
end
