class Attendee < ActiveRecord::Base
  belongs_to :attendee, :class_name => "User"
  belongs_to :event_attending, :class_name => "Event"

  validates :attendee_id, uniqueness: {scope: :event_attending_id, message: "you are already going to this event"}

end
