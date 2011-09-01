module Turing
  class Parser
    def self.parse(str)
      new(str).to_configurations
    end

    def initialize(machine_spec)
      @machine_spec = machine_spec
    end

    def split_lines
      @machine_spec.split("\n")
    end
    private :split_lines

    def to_configurations
      split_lines.map{ |line| Line.new(line).to_configuration }
    end

    class Line
      def initialize(line)
        @line = line
      end

      def to_configuration
        state, symbol, actions, end_state = @line.split(",").map{|e| e.strip}

        state     = state.intern
        symbol    = parse_symbol(symbol)
        actions   = parse_actions(actions)
        end_state = end_state.intern

        Turing::Machine::Configuration.new(state, symbol, actions, end_state)
      end

      private

      def parse_actions(actions)
        actions = actions.scan /P[^RLE]|R|L|E/
        actions.map do |action|
          case action
          when /P([^RLE])/ then [:write, parse_symbol($1)]
          when "R" then [:right]
          when "L" then [:left]
          when "E" then [:empty]
          end
        end
      end

      def parse_symbol(symbol)
        case symbol
        when "None" then nil
        when "0"    then 0
        when "1"    then 1
        else symbol.intern
        end
      end
    end
  end
end
