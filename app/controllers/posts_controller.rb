class PostsController < ApplicationController
	before_action :logged_in_user

	def index
		@posts = Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user.id)).order("DATE(updated_at), id desc").paginate(page: params[:page])

		respond_to do |format|
			format.html
			format.js { render 'partials/post_page' }
		end
	end

	def create
		@newpost = Post.new(post_params)
		@newpost.user_id = current_user.id

		if @newpost.save
			flash[:notice] = "New post created!"
			redirect_back(fallback_location: root_path, turbolinks: true)
		else
			flash[:error] = "An error occured while creating the post."
		end
	end

	def like
		@post = Post.find(params[:post_id])
		@user = current_user
		@post.like(@user)

		respond_to do |format|
			format.js
		end
	end

	def unlike
		@post = Post.find(params[:post_id])
		@user = current_user
		@post.unlike(@user)

		respond_to do |format|
			format.js
		end
	end

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end
end
