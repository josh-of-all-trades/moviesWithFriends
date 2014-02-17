class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
  		redirect_to events_path
  	else 
  		render 'new'
  	end
  end

  def event_params
  	params.require(:event).permit(:event_name, :event_date, :vote_end_time, :creator_id)
  end
  
  def index
  	@events = Event.all
  end
end