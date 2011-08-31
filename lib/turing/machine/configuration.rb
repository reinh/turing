module Turing
  class Machine
    # A Turing Machine Configuration is what in modern terms we would call a
    # state. A configuration has a label, the symbol it accepts, the action to
    # be performed, and an identifier for the next state to transition into.
    #
    # Actions are represented as an array of tuples of the form [action] or [action, symbol]
    # [action (Symbol)] one of [:write, :erase, :left, :right].
    # [symbol (Symbol, 0, 1)] the entity to write onto the tape, only used with :write
    #
    # This models a condensed Turing Machine configuration capable of
    # performing multiple actions per state transition.
    #
    # ==Examples:
    #
    #   [ [:erase], [:right], [:write, 1] ]
    class Configuration < Struct.new(:label, :symbol, :actions, :next_state); end
  end
end
