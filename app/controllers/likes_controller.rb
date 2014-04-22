class LikesController < ApplicationController


	def create
		@like = Like.new(like_params)
		if @like.save
			#Notifications.attended(@like).deliver
			redirect_to movies_path
		else
			redirect_to movies_path
		end
	end

	def like_params
		params.require(:like).permit(:liker_id, :liked_id)
	end

	def destroy
		@like = Like.find(params[:id])
		@like.destroy
		redirect_to movies_path
	end


end
