class PostsController < ApplicationController

	include ActionController::Live

	def index
		@posts = Post.all
	end

	def like
		@post = Post.find(params[:post_id])
		@user = User.find(params[:user_id])
		@post.like(@user)
		redirect_to root_path
	end

	def unlike
		@post = Post.find(params[:post_id])
		@user = User.find(params[:user_id])
		@post.unlike(@user)
		redirect_to root_path
	end
end
