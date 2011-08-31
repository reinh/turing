require 'helper'

describe Turing do
  describe Turing::Tape do
    describe "#position" do
      describe "when initialized" do
        it("must be 0") { Turing::Tape.new.position.must_equal 0 }
      end
    end

    describe "#read" do
      it "should return the entity at the current position"
    end
  end
end
