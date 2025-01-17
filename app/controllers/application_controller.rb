require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  helpers do
    def current_user
      User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end

  get "/" do
    erb :index
  end

  #Attempted "go back" link; seems to loop back to current page view
  # get "/back" do
  #   redirect back
  # end

end
