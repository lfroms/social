class SearchesController < ApplicationController
	before_action :logged_in_user
	before_action only: [:show] do
		has_access(Search.find(params[:id]).user_id)
	end

	def new
		@search = Search.new
	end

	def create
		@search = Search.create!(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	def search_params
		params.require(:search).permit(:keywords, :user_id)
	end
end
