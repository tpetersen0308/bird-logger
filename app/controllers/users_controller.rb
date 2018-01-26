class UsersController < ApplicationController

  get '/users/signup' do
    if logged_in?
      redirect "/users/#{current_user.slug}"
    else
      erb :'users/new'
    end
  end
  
  post '/users' do 
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{user.slug}"
      
    else
      redirect "/users/signup"
    end
  end
  
  
end
