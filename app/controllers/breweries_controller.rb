class BreweriesController < ApplicationController
  
  get '/breweries' do 
    @breweries = Brewery.all 
    
    erb :'/breweries/index'
  end
  
end 