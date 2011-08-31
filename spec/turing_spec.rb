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

    describe "#left" do
      it "should decrement the position of the tape" do
        head = Turing::Head.new
        head.right
        head.left
        head.position.must_equal 0
      end
    end
  end

  describe Turing::Tape do
    it "should be an array" do
      Turing::Tape.new.must_be_kind_of Array
    end

    describe "#inspect" do
      it "should include its class name" do
        Turing::Tape.new.inspect.must_include "<Turing::Tape>"
      end
    end
  end
end
