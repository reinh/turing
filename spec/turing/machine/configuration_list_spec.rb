require 'helper'

describe Turing::Machine::ConfigurationList do
  describe "#add" do
    it "returns the configuration added" do
      list = Turing::Machine::ConfigurationList.new
      configuration = list.add :b, 0, [], :b
      configuration.must_be_instance_of Turing::Machine::Configuration
      configuration.to_a.must_equal [:b, 0, [], :b]
    end

    describe "when the action is unknown" do
      it "raises a Turing::Machine::Error" do
        list = Turing::Machine::ConfigurationList.new
        lambda { list.add :b, 0, [[:unknown]], :b }.must_raise Turing::Machine::Error
      end
    end
  end

  describe "#get(label, symbol)" do
    describe "when there is no configuration with that label" do
      it "should return nil" do
        list = Turing::Machine::ConfigurationList.new
        configuration = list.add :b, 0, [], :b
        list.get(:c, 0).must_be_nil
      end
    end

    describe "when there is a configuration with that label that accepts that symbol" do
      it "should return the configuration" do
        list = Turing::Machine::ConfigurationList.new
        configuration = list.add :b, 0, [], :b
        list.get(:b, 0).must_equal configuration
      end
    end
  end
end
