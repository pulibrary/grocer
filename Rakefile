require_relative 'config/application'

require 'rubocop/rake_task'
require 'coveralls/rake/task'
Coveralls::RakeTask.new

Rails.application.load_tasks

RuboCop::RakeTask.new(:rubocop) do |task|
  task.requires << 'rubocop-rspec'
  task.fail_on_error = true
end

task spec: [:rubocop]

desc 'Run test suite and style checker'
task :ci do
  Rake::Task['spec'].invoke
end

task default: :ci
