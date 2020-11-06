class User < ActiveRecord::Base 
  has_many :breweries
  has_secure_password 

  validates :email, uniqueness: true
end 
