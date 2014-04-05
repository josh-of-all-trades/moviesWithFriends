class Event < ActiveRecord::Base
  belongs_to :creator
  
  has_many :movies, :dependent => :destroy
  has_many :attendees, :dependent => :destroy


  dateFormatValidation = /\d\d\/\d\d\/\d\d/

  validates :event_name, presence: true
  validates :event_date, format: {with: dateFormatValidation}
  validates :vote_end_time, format: {with: dateFormatValidation}
  
end
