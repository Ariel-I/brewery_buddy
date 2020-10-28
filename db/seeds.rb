4.times do 
  user = User.create(name: Faker::FunnyName.name, email: Faker::Internet.email)
  2.times do 
    user.breweries.create(name: Faker::FunnyName.name, location: Faker::Nation.name)
  end
end 