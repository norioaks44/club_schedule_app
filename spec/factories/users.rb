FactoryBot.define do
  factory :user do
    name                  { '田中太郎' }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    grade_id              { Faker::Number.within(range: 2..27) }
    position_id           { Faker::Number.within(range: 2..12) }
  end
end
