require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new :spec do |t, args|
  t.rspec_opts = "--tag ~integration"
end
