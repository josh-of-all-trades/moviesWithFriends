class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_date
      t.integer :num_votes
      t.belongs_to :event, index: true
      t.text :description

      t.timestamps
    end
  end
end
