class SightingsController < ApplicationController

  get '/sightings' do
    if logged_in?
      @sightings = Sighting.all
      erb :'sightings/index'
    else
      flash[:message] = "You must be logged in to view sightings. Please log in or sign up below."
      redirect '/'
    end
  end
  
  get '/sightings/new' do
    if logged_in?
      erb :'sightings/new'
    else
      flash[:message] = "You must be logged in to add new sightings. Please log in or sign up below."
      redirect '/'
    end
  end
end
