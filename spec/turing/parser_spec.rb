require 'helper'

describe Turing::Parser do
  describe "Line" do
    describe "#to_configuration" do
      it "should create a configuration for the line" do
        machine_spec = "b, None, P0RP1R, b"
        configuration = Turing::Machine::Configuration.new :b, nil, [[:write, 0], [:right], [:write, 1], [:right]], :b
        Turing::Parser::Line.new(machine_spec).to_configuration.must_equal configuration
      end
    end
  end

  describe "#to_configurations" do
    describe "with the simle 010101 machine" do
      it "should build the correct configurations" do
        machine_spec = <<-SPEC
          b, None, P0R, c
          c, None, R,   e
          e, None, P1R, f
          f, None, R,   b
        SPEC

        configurations = []
        configurations << Turing::Machine::Configuration.new(:b, nil, [[:write, 0], [:right]], :c)
        configurations << Turing::Machine::Configuration.new(:c, nil, [[:right]], :e)
        configurations << Turing::Machine::Configuration.new(:e, nil, [[:write, 1], [:right]], :f)
        configurations << Turing::Machine::Configuration.new(:f, nil, [[:right]], :b)
        Turing::Parser.new(machine_spec).to_configurations.must_equal configurations
      end
    end

    describe "with the condensed 010101 machine" do
      it "should build the correct configurations" do
        machine_spec = "b, None, P0RP1R, b"
        configuration = Turing::Machine::Configuration.new :b, nil, [[:write, 0], [:right], [:write, 1], [:right]], :b
        Turing::Parser.new(machine_spec).to_configurations.must_equal [configuration]
      end
    end
  end
end
