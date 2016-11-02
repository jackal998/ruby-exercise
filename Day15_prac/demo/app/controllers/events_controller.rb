class EventsController < ApplicationController
	def index
		
		@events =Event.all
		render "index"
	end
	def new
		@event = Event.new
		
	end
	def create
		@event = Event.new(params.require(:event).permit(:name,:description))

		if @event.save
			redirect_to :action => :index
		else
		end
	end
end

bundle