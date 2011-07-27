require 'rubygems'
require 'rake'

require 'spec/rake/spectask'

desc 'Default: run unit tests.'
task :default => :spec

desc "Run all tests"
task :test => :spec

desc "Verify AgentDescriptionAdapter against it's specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts << '--options' << 'spec/spec.opts' if File.exists?('spec/spec.opts')
  t.libs << 'lib'
  t.pattern = 'spec/**/*_spec.rb'
end

begin
  gem 'yard'
  require 'yard'
  desc 'Generate documentation for AgentDescriptionAdapter.'
  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb', 'README.markdown']
  end
rescue Exception
  # install YARD to generate documentation
end

desc 'Removes all temporary files'
task :clean

##############################################################################
# Packaging & Installation
##############################################################################

require 'echoe'

DM_AGENT_DESCRIPTION_ADAPTER_VERSION = "0.2.0"


Echoe.new('dm-agent-description-adapter', DM_AGENT_DESCRIPTION_ADAPTER_VERSION) do |p|
 p.description  = "AgentDescriptionAdapter provides a datamapper adapter for reading the agent template description xml files."
 p.url          = "http://absolute-performance.com/opensource/dm-agent-description-adapter"
 p.author       = "Paul Sadauskas"
 p.email        = "pjs@absolute-performance.com"

 p.clean_pattern = ['pkg/*']
 p.runtime_dependencies   = %w[dm-core dm-types nokogiri]
 p.development_dependencies = %w[rspec yard echoe]
end

