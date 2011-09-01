module Turing
  class Machine
    class Tape < Array
      def inspect
        "<#{self.class.name}>#{super}"
      end

      def to_s
        map{|e| e || '_'}.join
      end

      def to_binary_s
        select{|e| [0,1].include? e}.join
      end
    end
  end
end
