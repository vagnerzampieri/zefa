FactoryGirl.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              'senha123'
    password_confirmation 'senha123'
  end
end
