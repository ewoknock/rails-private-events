class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :event_attendees, foreign_key: :event_attendee_id
  has_many :attendees, through: :event_attendees, source: :event_attendee
end
