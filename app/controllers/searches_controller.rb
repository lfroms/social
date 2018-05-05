class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end

  def show
    raise ActionController::RoutingError.new('Unauthorized') unless has_access_to_search(params[:id])
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:keywords, :user_id)
  end

  private

  def has_access_to_search(search_id)
    true unless current_user.id != Search.find(search_id).user_id
  end
end
