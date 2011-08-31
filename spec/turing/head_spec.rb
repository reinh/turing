require 'helper'

describe Turing::Head do
  describe "#position" do
    describe "when initialized" do
      it("must be 0") { Turing::Head.new.position.must_equal 0 }
    end
  end

  describe "#read" do
    it "should return the entity at the current position on the tape" do
      head = Turing::Head.new
      head.write :x
      head.read.must_equal :x
    end
  end

  describe "#write" do
    it "should write the entity at the current position on the tape" do
      head = Turing::Head.new
      head.write :x
      head.read.must_equal :x
    end
  end

  describe "#erase" do
    it "should write a nil at the current position on the tape" do
      head = Turing::Head.new
      head.write :x
      head.read.must_equal :x
      head.erase
      head.read.must_be_nil
    end
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

