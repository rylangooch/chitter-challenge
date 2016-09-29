ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'datamapper_setup'

require_relative 'server'
require_relative 'controllers/app_controller'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
