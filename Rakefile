require "rspec/core/rake_task"
task :default => :test
desc "Run unit specs"
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = 'spec/*_spec.rb'
end