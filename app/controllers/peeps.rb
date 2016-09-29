class ChitterChallenge < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
      if current_user
        peep = Peep.create(text: params[:text], user: current_user)
        peep.save
        redirect '/peeps'
      else
        flash.keep[:notifications] = ['You need to log in to peep']
        redirect '/peeps'
      end
  end
end
