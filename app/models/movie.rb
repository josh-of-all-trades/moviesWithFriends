class Movie < ActiveRecord::Base
  belongs_to :event

  dateFormatValidation = /\d\d\/\d\d\/\d\d/


  validates :title, presence: true, uniqueness: true
  validates :release_date, format: {with: dateFormatValidation}
  #validates :description, length: {within: 1000..1500}




end
