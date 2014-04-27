class Like < ActiveRecord::Base
  belongs_to :liker, :class_name => "User"
  belongs_to :liked, :class_name => "Movie"


  validates :liker_id, uniqueness: {scope: :liked_id, message:"you already liked this movie"}


end
