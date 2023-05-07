class Event < ApplicationRecord
	has_many :event_attendances, foreign_key: :attendee_id
	has_many :attendees, through: :event_attendances, source: :attended_event
	belongs_to :creator, class_name: "User", foreign_key: :creator_id

	def past
		Event.where("date < ?", Time.now)
	end

	def future
		Event.where("date > ?", Time.now)
	end
end
