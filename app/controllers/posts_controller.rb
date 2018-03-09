class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def like
		@like = Like.new
		@like.liked_by_user_id = params[:user_id]
		@like.post_id = params[:post_id]
		@like.save
	end
end
