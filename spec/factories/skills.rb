FactoryBot.define do
  factory :skill do
    drill_name       { Faker::Lorem.characters(number: 40) }
    info             { Faker::Lorem.sentence }
    category_id   { Faker::Number.within(range: 2..4) }
    genre_id       { Faker::Number.within(range: 2..11) }

    association :user

    after(:build) do |skill|
      skill.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
