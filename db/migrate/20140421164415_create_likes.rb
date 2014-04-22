class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :liker, index: true
      t.belongs_to :liked, index: true

      t.timestamps
    end
  end
end
