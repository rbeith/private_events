class Event < ApplicationRecord
	has_many :event_attendances, foreign_key: :attended_event_id
	has_many :attendees, through: :event_attendances

	belongs_to :creator, class_name: "User", foreign_key: :creator_id, optional: true

	scope :past, -> { where("date < ?", Time.now) }
	scope :future, -> { where("date > ?", Time.now) }

end
