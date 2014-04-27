class AttendeesController < ApplicationController

	def create
		@attendee = Attendee.new(attendee_params)
		if @attendee.save
			if current_user.id != @attendee.attendee.id
				Notifications.attended(@attendee).deliver
			end
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
