ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'datamapper_setup'

# require_relative 'server'
# require_relative 'controllers/sessions'
# require_relative 'controllers/users'


class ChitterChallenge < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'
  use Rack::MethodOverride
  set :partial_template_engine, :erb
  enable :partial_underscores

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
    erb :'users/sign_up'
  end

  post '/users' do
  @user = User.create(email: params[:email], name: params[:name],
    username: params[:username], password: params[:password],
    password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect 'sessions/peeps'
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/sign_up'
  end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/sessions/peeps')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'Goodbye!'
  redirect to '/sessions/peeps'
end

get '/sessions/peeps' do
  erb :'sessions/peeps'
end
run! if app_file == $0

end
