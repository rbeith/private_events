class EventsController < ApplicationController
	def index
		@events = Event.all
		@user = current_user
		@past_events = Event.past
		@future_events = Event.future
		@attendances = EventAttendance.where("attendee_id = ?", @user.id)
	end

	def new
		@event = Event.new 
	end

	def show
		@user = current_user
		@event = Event.find(params[:id])
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			redirect_to @event
		else
			render :new, status: :unprocessable_entity
		end
	end
	
	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			flash.notice = "Event item successfully updated!"
			redirect_to event_url(@event)
		else
			flash.now.alert = "Edit failed to update."
			render :edit
		end
	end

	def destroy
		@event = Event.find(params[:id])
		if @event.destroy
			redirect_to event_url(@event), notice: "Event item deleted."
		else
			flash.now.error = "Failed to delete."
			render :edit
		end
	end 

	private

	def event_params
		params.require(:event).permit(:title, :description, :date, :location)
	end
end
