class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action only: [:show] do
    raise ActionController::RoutingError.new('Not Found') unless has_access
  end

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
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation, :profile_photo, :cover_photo, :locale)
  end

  private

  def has_access
    is_friends = current_user.friends.exists?(id: params[:id].to_i)
    is_self = current_user.id == params[:id].to_i

    is_friends || is_self ? true : false
  end
end
