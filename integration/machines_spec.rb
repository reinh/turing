require 'helper'

describe "machines" do
  describe "the simple .010101... machine" do
    describe "after 40 steps" do
      it "should have a binary string output of \"01010101010101010101\"" do
        machine = Turing::Machine.new
        machine.configuration_list.add :b, nil, [[:write, 0], [:right]], :c
        machine.configuration_list.add :c, nil, [[:right]], :e
        machine.configuration_list.add :e, nil, [[:write, 1], [:right]], :f
        machine.configuration_list.add :f, nil, [[:right]], :b
        40.times { machine.step }
        machine.head.tape.to_binary_s.must_equal "01010101010101010101"
      end
    end
  end

  describe "the condensed .010101... machine" do
    describe "after 10 steps" do
      it "should have a binary string output of \"01010101010101010101\"" do
        machine = Turing::Machine.new
        machine.configuration_list.add :b, nil, [[:write, 0], [:right], [:write, 1], [:right]], :b
        10.times { machine.step }
        machine.head.tape.to_binary_s.must_equal "01010101010101010101"
      end
    end
  end
end
