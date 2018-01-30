class BirdsController < ApplicationController

  get "/birds" do
    if logged_in?
      @birds = Bird.all.uniq
      erb :'birds/index'
    else
      flash[:message] = "You must be logged in to view birds. Please log in or sign up below."
      redirect '/'
    end
  end
end
