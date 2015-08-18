class EventsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def index
		@events = Event.all
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		event = Event.new(event_params)
		event.user = current_user
		if event.save
			redirect_to events_path
		else
			render 'index'
		end
	end

	def edit

	end

	def destroy

	end

	private
		def event_params
			params.require(:event).permit(:name, :date, :city, :state)
		end
end
