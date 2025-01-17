class UsersController < ApplicationController

  get '/signup' do
    # @user = User.find_by(params)
    if !logged_in?
     erb :"/users/create_user"
    else
      redirect to '/tweets'
    end
  end

  post '/signup' do
    user = User.new(params)
    user.save
    if user.save
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end


  get "/login" do
    if logged_in?
      redirect to "/tweets"
    else
      erb :'/users/login'
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/tweets"
    else
      redirect to "/signup"
    end
  end

  get "/logout" do
    if logged_in?
      session.destroy
      redirect to "/login"
    else
      redirect to "/"
    end
  end
  #
  #  POST route created for default "logout" view previously created
  #  post "/logout" do
  #  session.clear
  #   if logged_in?
  #      redirect to "/tweets"
  #    else
  #      redirect to "/login"
  #    end
  #  end

end
