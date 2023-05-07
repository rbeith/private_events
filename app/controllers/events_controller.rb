class EventsController < ApplicationController
	def index
		@events = Event.all
		@user = current_user
		@past_events = Event.past
		@future_events = Event.future
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

	private

	def event_params
		params.require(:event).permit(:title, :description, :date, :location)
	end
end
