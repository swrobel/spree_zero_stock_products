require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default => [:spec]

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_zero_stock_products'

  # use common:test_app intstead of extension:test_app
  # because the extension version includes spree_frontend, which we don't need
  Rake::Task['common:test_app'].invoke
end
