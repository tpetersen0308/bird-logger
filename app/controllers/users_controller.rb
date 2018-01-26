class UsersController < ApplicationController

  get '/users/signup' do
    if logged_in?
      redirect "/users/#{current_user.slug}"
    else
      erb :'users/new'
    end
  end
  
  
end
