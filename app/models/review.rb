class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :match_genre
  belongs_to :event
  belongs_to :user

  with_options presence: true do
    validates :match_genre_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :opponent_team
    validates :comment
  end

  validates :event_id, uniqueness: true

end
