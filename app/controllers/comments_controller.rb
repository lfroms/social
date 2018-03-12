class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id

		respond_to do |format|
			if @comment.save
				format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
				format.js   { }
				format.json { render :show, status: :created, location: comment }
			else
				format.html { render :new }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end
end
