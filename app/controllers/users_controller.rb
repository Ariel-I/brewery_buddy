class UsersController < ApplicationController
  
  get '/signup' do 
    erb :'/users/signup' 
  end 
  
  post '/signup' do 
  #  binding.pry 
    user = User.new(params)
     if user.save 
       session[:user_id] = user.id 
       redirect '/breweries'
     else
       redirect '/signup'
     end
   end 
  
end 