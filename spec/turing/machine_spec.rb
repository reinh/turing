require 'helper'

describe Turing::Machine do
  it "has a head" do
    Turing::Machine.new.head.must_be_instance_of Turing::Machine::Head
  end
end
