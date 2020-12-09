FactoryBot.define do
  factory :user do
    username {|n| Faker::Name.name}
    password {|p| Faker::Internet.password}
  end
end
