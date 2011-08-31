require 'helper'

describe Turing::Tape do
  it "should be an array" do
    Turing::Tape.new.must_be_kind_of Array
  end

  describe "#inspect" do
    it "should include its class name" do
      Turing::Tape.new.inspect.must_include "<Turing::Tape>"
    end
  end

  describe "#to_s" do
    it "should join the characters" do
      tape = Turing::Tape.new([1,2,3])
      tape.to_s.must_equal tape.join
      tape.to_s.must_equal "123"
    end

    it "should replace nils with underbars" do
      tape = Turing::Tape.new([1,nil,3])
      tape.to_s.must_equal "1_3"
    end
  end
end
