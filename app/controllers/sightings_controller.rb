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
    sighting = Sighting.new(:date => params[:date], :time => params[:time], :location => params[:location], :user_id => current_user.id, :bird_id => params[:bird_id], :notes => params[:notes])
    
    if sighting.save
      redirect "/sightings/#{sighting.id}"
    elsif params[:bird][:name] != ""
      sighting.bird_id = Bird.find_or_create_by(:name => params[:bird][:name]).id
      sighting.save
      redirect "/sightings/#{sighting.id}"
    else
      flash[:message] = "A sighting cannot be created without selecting or entering a bird."
      redirect '/sightings/new'
    end
  end
  
  get '/sightings/:id' do
    @sighting = Sighting.find_by(:id => params[:id])
    
    if @sighting && logged_in?
      erb :'/sightings/show'
    elsif logged_in?
      flash[:message] = "That sighting does not exist."
      redirect '/sightings'
    else
      flash[:message] = "You must be logged in to view sightings. Please log in or sign up below."
      redirect '/'
    end
  end
  
  get '/sightings/:id/edit' do
    @sighting = Sighting.find_by(:id => params[:id])
    
    if @sighting && current_user == @sighting.user
      erb :"sightings/edit"
    elsif @sighting && logged_in?
      flash[:message] = "You may only edit your own sightings!"
      redirect "users/#{current_user.slug}"
    elsif logged_in?
      flash[:message] = "That sighting does not exist."
      redirect "/sightings"
    else
      flash[:message] = "You must be logged in to view sightings. Please log in or sign up below."
      redirect '/'
    end
  end
  
  patch '/sightings/:id' do
    sighting = Sighting.find_by(:id => params[:id])
    sighting.update(:date => params[:date], :time => params[:time], :location => params[:location], :bird_id => params[:bird_id], :notes => params[:notes])
    
    if sighting.save && params[:bird][:name] == ""
      redirect "/sightings/#{sighting.id}"
    else
      sighting.bird_id = Bird.find_or_create_by(:name => params[:bird][:name]).id
      sighting.save
      redirect "/sightings/#{sighting.id}"
    end
  end
  
  get '/sightings/:id/delete' do
    sighting = Sighting.find_by(:id => params[:id])
    
    if sighting && current_user == sighting.user
      sighting.destroy
    elsif sighting && logged_in?
      flash[:message] = "You may only delete your own sightings!"
      redirect "users/#{current_user.slug}"
    elsif logged_in?
      flash[:message] = "That sighting does not exist."
      redirect "/sightings"
    else
      flash[:message] = "You must be logged in to delete sightings. Please log in or sign up below."
      redirect '/'
    end
  end
  
end
