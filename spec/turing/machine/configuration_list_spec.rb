require 'helper'

describe Turing::Machine::ConfigurationList do
  describe "#add" do
    before { @list = Turing::Machine::ConfigurationList.new }

    it "returns the configuration added" do
      configuration = @list.add :b, 0, [], :b
      configuration.must_be_instance_of Turing::Machine::Configuration
      configuration.to_a.must_equal [:b, 0, [], :b]
    end
  end
end
