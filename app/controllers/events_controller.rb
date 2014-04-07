class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	if @event.creator_id != current_user.id
      redirect_to 'new'
    else
      if @event.save
  		  redirect_to events_path
  	 else 
    		render 'new'
  	 end
    end
  end

  def event_params
  	params.require(:event).permit(:event_name, :event_date, :vote_end_time, :creator_id)
  end
  
  def index
  	@events = Event.all.order(:event_name)
  end

  def show
    @event = Event.find(params[:id])
    @attendees = Attendee.where(event_attending_id: @event.id)
    @users = User.where(id: @attendees).order(:name).limit(5)

    @movs = Movie.where(event_id: @event.id)
 
    @movies = Movie.where(id: @movs).order(:title)

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.creator_id != current_user.id
      render 'edit'
    else
      if @event.update_attributes(event_params)
        redirect_to event_path(@event.id)
      else 
        render 'edit'
      end
    end
  end


  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

end