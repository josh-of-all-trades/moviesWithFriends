class RemoveNumVotesFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :num_votes, :integer
  end
end
