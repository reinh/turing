module Turing
  class Runner
    def initialize(machine_spec, options={})
      @options = options
      @options[:steps] ||= 50
      @machine = Turing.build(machine_spec)
    end

    def run
      @options[:steps].times { @machine.step }
      puts @machine.head.tape.to_binary_s
    end
  end
end
