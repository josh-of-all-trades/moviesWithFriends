class AttendeesController < ApplicationController

	def create
		@attendee = Attendee.new(attendee_params)
		if @attendee.save
			Notifications.attended(@attendee).deliver
			redirect_to events_path
		else
			redirect_to events_path
		end
	end

	def attendee_params
		params.require(:attendee).permit(:attendee_id, :event_attending_id)
	end

	def destroy
		@attendee = Attendee.find(params[:id])
		@attendee.destroy
		redirect_to events_path
	end

end
