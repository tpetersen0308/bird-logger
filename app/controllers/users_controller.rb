require 'rack-flash'

class UsersController < ApplicationController
  
  configure do
    use Rack::Flash
  end  

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
  
  
end
