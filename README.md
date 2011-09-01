Turing
======

Synopsis
--------

Turing is a Turing Machine simulator. It models as nearly as possible the
original machine described in Turing's 1936 paper.

Features
--------

Create a Turing Machine with a number of configurations and then step through its execution.

For example, Turing's first machine (in its condensed form):

    machine = Turing::Machine.new
    machine.configuration_list.add :b, nil, [[:write, 0], [:right], [:write, 1], [:right]], :b
    10.times { machine.step }

    machine.head.tape.to_binary_s # =>"01010101010101010101" 

This machine prints the sequence "0101..." onto the tape on successive squares.
Note that Turing uses :b as the starting state... just as Turing did. Well, he
used a gothic letter 'b', but close enough.

### ASCII Turing Machine Specification

Read an ASCII Turing configuration language (TCL?) that specifies the
configurations of a Turing machine as closely to their specification in the
original paper as possible. For instance, the example machine above would be
represented as:

    b,  None,  P0RP1R,  b

That is, a machine with one configration, called b. When in state b on an empty
square (None), the machine will print 0 (P0), move right (R), print 1 (P1),
move right (R) and end in state b.

Contributors
------------

Rein Henrichs: <reinh@reinh.com>
