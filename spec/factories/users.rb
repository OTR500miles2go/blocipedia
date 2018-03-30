FactoryBot.define do
  pw = RandomData.random_sentence

  factory :user do
    username RandomData.random_name
    email RandomData.random_email
    role :standard
    password pw
    password_confirmation pw
  end
end 
