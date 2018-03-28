require 'random_data'
require 'faker'

Faker::UniqueGenerator.clear

20.times do
    User.create!(
        username: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(6, 14)
    )
end
users= User.all

50.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::WorldOfWarcraft.hero,
        body: Faker::DrWho.quote
    )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"