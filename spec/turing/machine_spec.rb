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
end
