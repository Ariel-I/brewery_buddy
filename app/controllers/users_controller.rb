class UsersController < ApplicationController
  
  get '/signup' do 
    erb :'/users/signup' 
  end 
  
  post '/signup' do 
    uers = User.new(params)
     if user.save 
       redirect '/breweries'
     else
       redirect '/users/signup'
     end
   end 
  
end 