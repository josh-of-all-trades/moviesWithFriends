class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :vote_end_time
      t.string :event_date
      t.integer :event_id
      t.belongs_to :creator, index: true
      t.string :event_name

      t.timestamps
    end
  end
end
