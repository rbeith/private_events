class UserController < ApplicationController
	def show
		@events = User.events.all
	end
end
