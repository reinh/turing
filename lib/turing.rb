require 'turing/machine'
require 'turing/parser'
require 'turing/runner'

module Turing
  def self.read_from_file(fh)
    build(File.read(fh))
  end

  def self.build(str)
    configurations = Turing::Parser.parse(str)
    Turing::Machine.new(configurations)
  end
end
