FactoryBot.define do
  factory :review do
    match_genre_id
    opponent_team
    comment
    match_url
    match_date
  end
end
