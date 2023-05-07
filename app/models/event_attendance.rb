class EventAttendance < ApplicationRecord
	belongs_to :attended_event, class_name: "User"
	belongs_to :attendee, class_name: "Event"

	validates :attendee, uniqueness: true
end
