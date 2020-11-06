class User < ActiveRecord::Base 
  has_many :breweries
  has_secure_password 
end 
