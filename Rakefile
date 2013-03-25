require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new :spec do |t, args|
  t.rspec_opts = "--tag ~integration"
end

require 'audio_stuffs'
namespace :db do
  task :create do
    require 'audio_stuffs/models/schema'
    AudioStuffs.initialize!
    AudioStuffs::Schema.create!
  end
end
