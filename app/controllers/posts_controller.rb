class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		@like = Like.new
		@like.user_id = params[:user_id]
		@like.post_id = params[:post_id]
		@like.save
	end
end
