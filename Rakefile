require 'bundler/setup'
require 'rspec/core/rake_task'
require 'engine_cart/rake_task'
require 'rubocop/rake_task'
require 'coveralls/rake/task'
Dir.glob('tasks/*.rake').each { |r| import r }

Bundler::GemHelper.install_tasks

Coveralls::RakeTask.new

namespace :grocer do
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.requires << 'rubocop-rspec'
    task.fail_on_error = true
  end

  RSpec::Core::RakeTask.new(:rspec)

  desc 'Run test suite'
  task :spec do
    Rake::Task['grocer:rspec'].invoke
  end
end

desc 'Run tests'
task spec: ['grocer:spec']

desc 'Run the full test suite'
task ci: ['grocer:rubocop', 'engine_cart:generate'] do
  Rake::Task['spec'].invoke
end

task clean: 'engine_cart:clean'
task default: :ci
