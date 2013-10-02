require "rspec/core/rake_task"
require "rake/testtask"

desc "Run unit specs"
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = 'spec/*_spec.rb'
end
task :default => :spec