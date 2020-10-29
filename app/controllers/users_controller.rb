class UsersController < ApplicationController
  
  get '/signup' do 
    erb :signup 
  end 
  
  post '/signup' do 
    uers = User.new(params)
     if user.save 
       redirect '/breweries'
     else
       redirect '/signup'
     end
   end 
  
end 