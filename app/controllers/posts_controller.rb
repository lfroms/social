class PostsController < ApplicationController
	before_action :logged_in_user

	def index
		@posts = Post.order("DATE(updated_at), id desc").paginate(page: params[:page])

		respond_to do |format|
			format.html
			format.js { render 'partials/post_page' }
		end
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
