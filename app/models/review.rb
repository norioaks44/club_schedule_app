class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :match_genre
  belongs_to :event, dependent: :destroy
  belongs_to :user, dependent: :destroy

  with_options presence: true do
    validates :match_genre_id
    validates :opponent_team
    validates :comment, length: { maximum: 1000 }
    validates :match_date
  end

  validates :event_id, uniqueness: true

  URL_REGEX =  /\A#{URI::regexp(%w(http https))}\z/.freeze
  validates :match_url, format: { with: URL_REGEX, message: "enter the URL", allow_blank: true }

end
