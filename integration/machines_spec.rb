require 'helper'

describe "machines" do
  describe "the .010101... machine" do
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
