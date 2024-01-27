class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :event_attendees, foreign_key: :event_attendee_id
  has_many :attendees, through: :event_attendees, source: :event_attendee

  scope :past, -> { where('date_time < ?', Date.today) }
  scope :upcoming, -> { where('date_time > ?', Date.today) }
end
