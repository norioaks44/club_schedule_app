class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :title
  belongs_to :meeting_time
  
  has_one :event_match

  with_options presence: true do
    validates :title_id, numericality: { other_than: 1, message: 'Select' }
    validates :start_time, uniqueness: true
    validates :meeting_time_id, numericality: { other_than: 1, message: 'Select' }
  end
  

end
