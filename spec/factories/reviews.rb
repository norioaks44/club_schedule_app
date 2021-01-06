FactoryBot.define do
  factory :review do
    match_genre_id         { Faker::Number.within(range: 1..6) }
    opponent_team          { 'てすと' }
    comment                { Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false) }
    match_url              { Faker::Internet.url }
    match_date             { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
    association :user
    association :event
  end
end
