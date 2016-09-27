ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'datamapper_setup'

class ChitterChallenge < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

 #  post '/peeps' do
 #   if current_user
 #     peep = Peep.create(body: params[:peep], time: Time.now)
 #     peep.user = current_user
 #     peep.peep = Peep.get(params[:in_reply_to])
 #     peep.save
 #     redirect '/peeps'
 #   else
 #     flash.keep[:notifications] = ['You need to log in to peep']
 #     redirect '/peeps'
 #   end
 # end

  post '/peeps' do
    # peep = Peep.create(text: params[:text])
    # peep.user = current_user
    # peep.save
    # redirect to '/peeps'
      if current_user
        peep = Peep.new(text: params[:text])
        peep.user = [current_user]
        peep.save
        redirect '/peeps'
      else
        flash.keep[:notifications] = ['You need to log in to peep']
        redirect '/peeps'
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
      redirect '/peeps'
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
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  run! if app_file == $0

end
