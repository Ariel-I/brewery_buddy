class Brewery < ActiveRecord::Base 
  belongs_to :user
  
  validates :name, :location, presence: true
end 