ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/datamapper_setup'
require 'sinatra/flash'

class ChitterChallenge < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  get '/users/new' do
    @user = User.new
    erb :'sign_up'
  end

  post '/users' do
  @user = User.create(email: params[:email], name: params[:name],
    username: params[:username], password: params[:password],
    password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect '/peeps'
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'sign_up'
  end
end

get '/peeps' do
  erb :'peeps'
end


  run! if app_file == $0
end
