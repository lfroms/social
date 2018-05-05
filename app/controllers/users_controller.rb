class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id]).paginate(page: params[:page]).order("DATE(updated_at), id desc")

    respond_to do |format|
      format.html
      format.js { render 'partials/post_page' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation, :profile_photo, :cover_photo)
  end
end
