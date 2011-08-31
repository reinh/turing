require 'helper'

describe Turing::Machine do
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
  end
end
