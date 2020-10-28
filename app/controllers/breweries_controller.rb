class BreweriesController < ApplicationController
  
  get '/breweries' do 
    @breweries = Brewery.all 
    
    erb :'/breweries/index'
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