require 'turing/machine'
require 'turing/parser'
require 'turing/runner'

module Turing
  def self.read_from_file(fh)
    Machine.build(File.read(fh))
  end
end
