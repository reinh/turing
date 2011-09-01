require 'helper'
require 'stringio'

describe Turing do
  describe ".build" do
    it "should parse the configurations from the file" do
      machine_spec = <<-SPEC
        b, None, P0R, c
        c, None, R,   e
        e, None, P1R, f
        f, None, R,   b
      SPEC

      given = Turing.build(machine_spec)

      expected = Turing::Machine.new([
        [:b, nil, [[:write, 0], [:right]], :c],
        [:c, nil, [[:right]],              :e],
        [:e, nil, [[:write, 1], [:right]], :f],
        [:f, nil, [[:right]],              :b]
      ])

      given.must_be :==, expected
    end
  end
end
