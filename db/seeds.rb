require 'random_data'
require 'faker'

Faker::UniqueGenerator.clear

User.create!(
    username: "admin",
    email: "admin@admin.com",
    password: "admin098admin",
    role: "admin"
)

10.times do
    User.create!(
        username: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(6, 14),
        role: "standard"
    )
end

10.times do
    User.create!(
        username: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(6, 14),
        role: "premium"
    )
end

users= User.all
15.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::WorldOfWarcraft.hero,
        body: RandomData.random_paragraph + Faker::DrWho.quote,
        private: false
    )
end

10.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::LeagueOfLegends.champion,
        body: RandomData.random_paragraph + Faker::LeagueOfLegends.quote,
        private: true
    )
end

Collaborator.create!(user_id:  1, wiki_id: 18)
Collaborator.create!(user_id:  2, wiki_id: 18)
Collaborator.create!(user_id: 11, wiki_id: 18)
Collaborator.create!(user_id: 12, wiki_id: 18)
Collaborator.create!(user_id:  9, wiki_id: 22)
Collaborator.create!(user_id: 11, wiki_id: 22)
Collaborator.create!(user_id: 17, wiki_id: 22)
Collaborator.create!(user_id: 18, wiki_id: 22)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
