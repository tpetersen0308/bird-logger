require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end
  
  get '/login' do
    if logged_in?
      redirect "/users/#{current_user.slug}"
    else
      erb :login
    end
  end
  
  post '/login' do
    user = User.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.slug}"
    else
      flash[:message] = "Invalid password/username combination. Please try again."
      redirect '/login'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(:id => session[:user_id])
    end
  end
end
