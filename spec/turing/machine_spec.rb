require 'helper'

describe Turing::Machine do
  describe ".build" do
    it "should parse the configurations from the file" do
      machine_spec = <<-SPEC
        b, None, P0R, c
        c, None, R,   e
        e, None, P1R, f
        f, None, R,   b
      SPEC

      given = Turing::Machine.build(machine_spec)

      expected = Turing::Machine.new([
        [:b, nil, [[:write, 0], [:right]], :c],
        [:c, nil, [[:right]],              :e],
        [:e, nil, [[:write, 1], [:right]], :f],
        [:f, nil, [[:right]],              :b]
      ])

      given.must_be :==, expected
    end
  end

  it "has a configuration list" do
    Turing::Machine.new.configuration_list.must_be_instance_of Turing::Machine::ConfigurationList
  end

  it "has a head" do
    Turing::Machine.new.head.must_be_instance_of Turing::Machine::Head
  end

  describe "#current_state" do
    it "defaults to :b" do
      Turing::Machine.new.current_state.must_equal :b
    end
  end

  describe "#current_configuration" do
    it "gets the configuration for the current state and tape symbol" do
      machine = Turing::Machine.new
      config = machine.configuration_list.add :b, nil, [], :b
      machine.current_configuration.must_equal config
    end
  end

  describe "#step" do
    describe "when there is no configuration for the current state and tape symbol" do
      it "should raise Turing::Machine::UnsatisfactoryError" do
        machine = Turing::Machine.new
        lambda { machine.step }.must_raise Turing::Machine::UnsatisfactoryError
      end
    end

    describe "when there is a configuration for the current state and tape symbol" do
      it "should not raise Turing::Machine::UnsatisfactoryError" do
        machine = Turing::Machine.new
        config = machine.configuration_list.add :b, nil, [], :b
        machine.step
      end
    end

    describe "when the configuration action is [[:write, 0]]" do
      it "writes a 0 to the tape" do
        machine = Turing::Machine.new
        config = machine.configuration_list.add :b, nil, [[:write, 0]], :b
        machine.step
        machine.head.read.must_equal 0
      end
    end

    describe "when the configuration action is [[:erase]]" do
      it "writes a nil to the tape" do
        machine = Turing::Machine.new
        machine.head.write 0
        config = machine.configuration_list.add :b, 0, [[:erase]], :b
        machine.step
        machine.head.read.must_equal nil
      end
    end

    describe "when the configuration action is [[:right]]" do
      it "moves the tape to the right" do
        machine = Turing::Machine.new
        config = machine.configuration_list.add :b, nil, [[:right]], :b
        old_pos = machine.head.position
        machine.step
        machine.head.position.must_equal old_pos + 1
      end
    end

    describe "when the configuration action is [[:left]]" do
      it "moves the tape to the left" do
        machine = Turing::Machine.new
        config = machine.configuration_list.add :b, nil, [[:left]], :b
        old_pos = machine.head.position
        machine.step
        machine.head.position.must_equal old_pos - 1
      end
    end

    describe "when the configuration's next state is :c" do
      it "changes the machine's current state to :c" do
        machine = Turing::Machine.new
        config = machine.configuration_list.add :b, nil, [[:left]], :c
        machine.step
        machine.current_state.must_equal :c
      end

    end
  end

  describe "#==" do
    describe "when the configuration list, current state, tape position and tape contents are the same" do
      it "should be true" do
        given = Turing::Machine.new
        given.configuration_list.add :b, nil, [[:left]], :c

        expected = Turing::Machine.new
        expected.configuration_list.add :b, nil, [[:left]], :c

        given.must_be :==, expected
      end
    end
  end
end
