class BreweriesController < ApplicationController
  
  get '/breweries' do 
      redirect_not_logged_in
      @breweries = current_user.breweries
      erb :'/breweries/index'
  end
  
  get '/breweries/new' do 
      redirect_not_logged_in
      erb :'breweries/new'
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
      redirect_not_logged_in
      if @brewery = current_user.breweries.find_by(id: params[:id])
        erb :"/breweries/edit"
      else
        redirect '/breweries'
      end 
  end
  
  patch '/breweries/:id' do 
      if brewery = current_user.breweries.find_by(id: params[:id])
        brewery.update(name: params[:name], location: params[:location], beverages: params[:beverages])
        redirect "/breweries/#{brewery.id}"
      else 
        redirect "/breweries/#{brewery.id}/edit"
      end
  end 
  
  get '/breweries/:id' do 
      redirect_not_logged_in
      @brewery = current_user.breweries.find_by(id: params[:id])
      if @brewery 
        erb :'breweries/show'
      else 
        redirect '/breweries'
      end  
  end 
   
  delete '/breweries/:id' do 
      redirect_not_logged_in
      @brewery = current_user.breweries.find_by(id: params[:id])
      if @brewery
         @brewery.destroy
      end
         redirect '/breweries'
  end 
  
end 