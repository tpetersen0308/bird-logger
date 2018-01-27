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
      flash[:message] = "Signup unsuccessful. Please try again; each field must be completed."
      redirect "/users/signup"
    end
  end
  
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    
    if @user && logged_in?
      erb :'/users/show'
    elsif logged_in?
      flash[:message] = "That user account does not exist."
      redirect '/'
    else
      flash[:message] = "You must be logged in to view user accounts. Please log in or sign up below."
      redirect '/'
    end
  end
      
  
end
