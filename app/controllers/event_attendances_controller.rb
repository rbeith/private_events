class EventAttendancesController < ApplicationController
	def new
		@attendance = EventAttendance.new
		@user = current_user
	end

	def create
		@event = Event.find(params[:event_id])
		@user = User.find(params[:user_id])
		@attendance = EventAttendance.new(attendee: @user, attended_event: @event)

		if @attendance.save
			redirect_to :root
		else
			flash.alert = "You're already attending this event!"
			@future_events = Event.future
			@past_events = Event.past
			@user = current_user
			render 'events/index', status: :unprocessable_entity
		end
	end

	private

	def attendance_params
	  params.require(:user).permit(:event_id)
	end

end
