require 'helper'
require 'stringio'

describe Turing do
  describe ".from_io" do
    it "should parse the configurations from the file" do
      machine_spec = <<-SPEC
        b, None, P0R, c
        c, None, R,   e
        e, None, P1R, f
        f, None, R,   b
      SPEC

      machine_spec_io = StringIO.new(machine_spec)

      given = Turing.from_io(machine_spec_io)

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
