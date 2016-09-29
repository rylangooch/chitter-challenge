class ChitterChallenge < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'
  set :partial_template_engine, :erb
  use Rack::MethodOverride

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
