require './config/environment'


class ApplicationController < Sinatra::Base
  require 'rack-flash'

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
		use Rack::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.slug}"
    else
      erb :index
    end
  end
  
  get '/login' do
    if logged_in?
      flash[:message] = "You are already logged in!"
      redirect "/users/#{current_user.slug}"
    else
      erb :login
    end
  end
  
  post '/login' do
    user = User.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome, #{user.username}!"
      redirect "/users/#{user.slug}"
    else
      flash[:message] = "Invalid password/username combination. Please try again."
      redirect '/login'
    end
  end
  
  get '/logout' do
    user = current_user
    session[:user_id] = nil
    flash[:message] = "Goodbye, #{user.username}!"
    redirect '/'
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
