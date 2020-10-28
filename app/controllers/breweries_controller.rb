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
    brewery = user.breweries.build(params)
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