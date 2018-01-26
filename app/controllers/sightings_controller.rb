class SightingsController < ApplicationController

  # GET: /sightings
  get "/sightings" do
    erb :"/sightings/index.html"
  end

  # GET: /sightings/new
  get "/sightings/new" do
    erb :"/sightings/new.html"
  end

  # POST: /sightings
  post "/sightings" do
    redirect "/sightings"
  end

  # GET: /sightings/5
  get "/sightings/:id" do
    erb :"/sightings/show.html"
  end

  # GET: /sightings/5/edit
  get "/sightings/:id/edit" do
    erb :"/sightings/edit.html"
  end

  # PATCH: /sightings/5
  patch "/sightings/:id" do
    redirect "/sightings/:id"
  end

  # DELETE: /sightings/5/delete
  delete "/sightings/:id/delete" do
    redirect "/sightings"
  end
end
