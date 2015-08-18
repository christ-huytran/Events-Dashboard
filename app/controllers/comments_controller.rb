class CommentsController < ApplicationController
	def create
		comment = Comment.new(comment_params)
		if !comment.save
			flash[:error] = 'Please type a valid comment'
		end
		redirect_to event_path(comment.event)
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :user_id, :event_id)
		end
end
