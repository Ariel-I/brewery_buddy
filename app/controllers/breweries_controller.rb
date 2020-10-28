class BreweriesController < ApplicationController
  
  get '/breweries' do 
    @breweries = Brewery.all 
    
    erb :'/breweries/index'
  end
  
  get '/breweries/new' do 
    @user = User.all 
    erb :'breweries/new'
  end 
  
  post '/breweries' do 
    user = User.find_by(id: params[:user_id])
    breweries = user.breweries.build(params)
    if brewery.save
      redirect "/breweries/#{brewery.id}"
  end 
  
  
  
  get '/breweries/:id' do 
    @brewery = Brewery.find_by(id: params[:id])
    
    if @brewery 
      erb :'breweries/show'
    else 
      redirect '/breweries'
    end 
   end 
  
end 