class CreateBrewery < ActiveRecord::Migration
  
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.string :beverages
      t.integer :user_id
    end 
  end
  
end
