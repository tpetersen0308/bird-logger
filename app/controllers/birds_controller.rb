class BirdsController < ApplicationController

  get "/birds" do
    if logged_in?
      @birds = Bird.all.uniq.order_by(&:name)
      erb :'birds/index'
    else
      flash[:message] = "You must be logged in to view birds. Please log in or sign up below."
      redirect '/'
    end
  end
  
  get "/birds/:slug" do
    if logged_in?
      @bird = Bird.find_by_slug(params[:slug])
      erb :"birds/show"
    else
      flash[:message] = "You must be logged in to view birds. Please log in or sign up below."
      redirect '/'
    end
  end
end
