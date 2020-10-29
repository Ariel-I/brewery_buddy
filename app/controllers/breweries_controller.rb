class BreweriesController < ApplicationController
  
  get '/breweries' do 
    if logged_in?
      @breweries = current_user.breweries
      erb :'/breweries/index'
    else 
      redirect '/login'
    end 
  end
  
  get '/breweries/new' do 
    if logged_in? 
      erb :'breweries/new'
    else 
      redirect :'/login'
    end 
  end 
  
  post '/breweries' do 
    brewery = current_user.breweries.build(params)
    if brewery.save
      redirect "/breweries/#{brewery.id}"
    else
      redirect "/breweries/new"
    end
  end 
  
  get '/breweries/:id/edit' do 
    if logged_in?
     @brewery = current_bar.user.breweries.find_by(params)
      if @brewery
        erb :"/breweries/edit"
      else
        redirect '/breweries'
      end 
    else
     redirect '/login'
   end
  end
  
  patch '/breweries/:id' do 
    if logged_in?
    brewery = current_user.breweries.find_by(id: params[:id])
     if brewery 
      if brewery.update(name: params[:name], location: params[:location])
       redirect "/breweries/#{brewery.id}"
      else 
       redirect '/breweries'
      end 
    else 
      redirect '/breweries'
    end 
  end 
  
  get '/breweries/:id' do 
    if logged_in?
      @brewery = Brewery.find_by(id: params[:id])
      if @brewery 
        erb :'breweries/show'
      else 
        redirect '/breweries'
      end 
    else 
      redirect '/login'
    end 
  end 
   
  delete '/breweries/:id' do 
    if logged_in?
      @brewery = current_user.breweries.find_by(id: params[:id])
       if @brewery
          @brewery.destroy
       else 
         redirect '/breweries'
       end 
    else 
      redirect '/login'
    end
  end 
  
end 