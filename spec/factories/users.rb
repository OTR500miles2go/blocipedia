FactoryBot.define do
  pw = RandomData.random_sentence

  factory :user do
    username RandomData.random_name
    role :standard
    password pw
    password_confirmation pw
  end
end 
