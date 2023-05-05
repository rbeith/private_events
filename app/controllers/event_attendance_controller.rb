class EventAttendanceController < ApplicationController
	def new
		@event_attendance = EventAttendance.new
	end

	def create
		@event_attendance = EventAttendance.new(event_attendance_params)
	end

	private

	def event_attendance_params
	  params.require(:event_attendance).permit(:attended_event_id, :attendee_id)
	end
	
end
