class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.js {}
      else
        flash[:error] = "Could not process request."
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
