class PostsController < ApplicationController
	before_action :logged_in_user

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
