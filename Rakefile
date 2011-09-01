# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

Bundler::GemHelper.install_tasks

namespace :spec do
  require 'rake/testtask'
  Rake::TestTask.new(:unit) do |spec|
    spec.libs << 'lib' << 'spec'
    spec.pattern = 'spec/**/*_spec.rb'
    spec.verbose = true
  end

  Rake::TestTask.new(:integration) do |spec|
    spec.libs << 'lib' << 'integration'
    spec.pattern = 'integration/**/*_spec.rb'
    spec.verbose = true
  end

  Rake::TestTask.new(:all) do |spec|
    spec.libs << 'lib' << 'spec' << 'integration'
    spec.pattern = '{spec,integration}/**/*_spec.rb'
    spec.verbose = true
  end

  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |spec|
    spec.libs << 'spec'
    spec.pattern = 'spec/**/*_spec.rb'
    spec.verbose = true
    spec.rcov_opts << '--exclude "gems/*"'
  end
end

desc "Run tests for unit"
task :spec => 'spec:unit'

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
