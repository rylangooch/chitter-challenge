if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require_relative 'app/app.rb'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
