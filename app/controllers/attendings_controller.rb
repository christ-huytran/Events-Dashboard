class AttendingsController < ApplicationController
	def create
		Attending.create(user: current_user, event: Event.find(params[:event_id]))
		redirect_to events_path
	end

	def destroy
		attending = Attending.find_by(user: User.find(session[:user_id]), event: Event.find(params[:event_id]))
		attending.destroy
		redirect_to events_path
	end
end
