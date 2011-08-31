require 'helper'

describe Turing do
  describe Turing::Head do
    describe "#position" do
      describe "when initialized" do
        it("must be 0") { Turing::Head.new.position.must_equal 0 }
      end
    end

    describe "#read" do
      it "should return the entity at the current position"
    end

    describe "#right" do
      it "should increment the position of the tape" do
        head = Turing::Head.new
        head.right
        head.position.must_equal 1
      end
    end
  end
end
