require 'af_gems/appraisal'
require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

namespace :test do
  AfGems::RubyAppraisalTask.new(:all, ['ruby-2.5.3', 'ruby-2.6.3'])
end

task :default => :test
