class UsersController < ApplicationController
	before_action :logged_in_user

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: params[:id])
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
