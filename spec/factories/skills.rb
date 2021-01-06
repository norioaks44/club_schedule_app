FactoryBot.define do
  factory :skill do
    drill_name       { Faker::Lorem.characters(number: 20) }
    info             { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 1..4) }
    genre_id { Faker::Number.within(range: 1..11) }
    skill_url { Faker::Internet.url }
    association :user
  end
end
