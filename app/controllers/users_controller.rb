class UsersController < ApplicationController
	def show
		@events = current_user.events.all
	end

	def edit
		@event = Event.find(params[:id])
	end

end
