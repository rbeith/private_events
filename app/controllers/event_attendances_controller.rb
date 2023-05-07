class EventAttendancesController < ApplicationController
	def new
		@attendance = EventAttendance.new
		@user = current_user
	end

	def create
		@attendance = EventAttendance.create(attendee_id: params[:attendee_id], attended_event_id: params[:attended_event_id])

		if @attendance.save
			redirect_to :root
		else
			@events = Event.all
			@user = current_user
			render 'events/index', status: :unprocessable_entity
		end
	end

	private

	def attendance_params
	  params.require(:event_attendance).permit(:attendee_id, :attended_event_id)
	end

end
