class CreateBeverage < ActiveRecord::Migration
  
  def change
    create_table :beverages do |t|
      t.string :name 
      t.string :style 
      t.integer :abv 
    end 
  end
  
end
