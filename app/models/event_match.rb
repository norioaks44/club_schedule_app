class EventMatch < ApplicationRecord
  belongs_to :event
  has_one :review
end
