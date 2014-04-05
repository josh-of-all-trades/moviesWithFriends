class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :attendee, index: true
      t.belongs_to :event_attending, index: true

      t.timestamps
    end
  end
end
