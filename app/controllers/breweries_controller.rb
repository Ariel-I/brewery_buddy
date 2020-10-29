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
    @users = User.all 
    @brewery = Brewery.find_by(params)
    
    erb :"/breweries/edit"
  end
  
  patch '/breweries/:id' do 
    brewery = Brewery.find_by(id: params[:id])
    
    if brewery.update(name: params[:name], location: params[:location])
      redirect "/breweries/#{brewery.id}"
    else 
      redirect "breweries/#{brewery.id}/edit"
    end 
  end 
  
  get '/breweries/:id' do 
    @brewery = Brewery.find_by(id: params[:id])
    
    if @brewery 
      erb :'breweries/show'
    else 
      redirect '/breweries'
    end 
   end 
   
  delete '/breweries/:id' do 
    @brewery = Brewery.find_by(id: params[:id])
    @brewery.destroy
    redirect '/breweries'
  end 
  
end 