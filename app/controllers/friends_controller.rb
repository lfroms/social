class FriendsController < ApplicationController
	before_action :logged_in_user
	before_action :set_friend, only: :destroy

	def index
		@friends = current_user.friends
	end

	def destroy
		current_user.remove_friend(@friend, current_user)

		respond_to do |format|
			format.js {}
		end
	end

	private

	def set_friend
		@friend = current_user.friends.find(params[:id])
	end
end
