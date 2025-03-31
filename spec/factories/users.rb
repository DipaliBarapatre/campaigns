# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name } # Generates a random name
    email {Faker::Internet.email}
    campaigns_list {
      [
        {campaigns_name: Faker::Name.name, campaigns_id: rand(11..20)}
      ]
    }
  end
end