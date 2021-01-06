class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :title
  belongs_to :meeting_time

  belongs_to :user
  has_one :review, dependent: :destroy

  with_options presence: true do
    validates :title_id
    validates :start_time, uniqueness: true
    validates :meeting_time_id
  end

  validates :info, length: { maximum: 1000 }
end
