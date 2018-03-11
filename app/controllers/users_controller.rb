class UsersController < ApplicationController

	def index
		logged_in_user
		@users = User.all
	end

	def show
		logged_in_user
		@user = User.find(params[:id])
		@posts = Post.where(user_id: params[:id]).paginate(page: params[:page]).order("DATE(updated_at), id desc")

		respond_to do |format|
			format.html
			format.js { render 'partials/post_page' }
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			log_in @user
			flash[:success] = "Welcome to Social!"
			redirect_to :feed
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
	end
end
