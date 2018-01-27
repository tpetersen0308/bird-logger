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
  
  post '/sightings' do
    sighting = Sighting.new(:date => params[:date], :time => params[:time], :location => params[:location], :user_id => current_user.id, :bird_id => params[:bird_id])
    
    if sighting.save
      redirect "/sightings/#{sighting.id}"
    elsif params[:bird][:name] != ""
      sighting.bird = Bird.find_or_create_by(:name => params[:bird][:name])
      sighting.save
      redirect "/sightings/#{sighting.id}"
    else
      flash[:message] = "A sighting cannot be created without selecting or entering a bird."
      redirect '/sightings/new'
    end
  end
  
  get '/sightings/:id' do
    @sighting = sighting.find_by(:id => params[:id])
    
    if @sighting && logged_in?
      erb :'/sighting/show'
    elsif logged_in?
      flash[:message] = "That sighting does not exist."
      redirect '/sightings'
    else
      flash[:message] = "You must be logged in to view sightings. Please log in or sign up below."
      redirect '/'
    end
  end
end
