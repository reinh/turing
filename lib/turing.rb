require 'turing/machine'
require 'turing/parser'

module Turing
  def self.read_from_file(fh)
    from_io(File.read(fh))
  end

  def self.from_io(io)
    configurations = Turing::Parser.parse(io.read)
    Turing::Machine.new(configurations)
  end
end
