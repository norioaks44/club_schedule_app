class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :title
  belongs_to :meeting_time

  with_options presence: true do
    validates :title_id, numericality: { other_than: 1, message: 'Select' }
    validates :start_time, uniqueness: true
    validates :meeting_time_id, numericality: { other_than: 1, message: 'Select' }
  end
  
  has_one :event

end
