# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "turing/version"

Gem::Specification.new do |s|
  s.name        = "turing"
  s.version     = Turing::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rein Henrichs"]
  s.email       = ["reinh@reinh.com"]
  s.homepage    = "reinh.com"
  s.summary     = %q{A Turing Machine simulator}
  s.description = %q{A Turing Machine simulator. Designed to be as accurate to Turing's original machine specification as possible.}

  s.rubyforge_project = "turing"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "yard",                "~> 0.6.0"
  s.add_development_dependency "bundler",             "~> 1.0.0"
  s.add_development_dependency "minitest",            ">= 0"
  s.add_development_dependency "rcov",                ">= 0"
end
