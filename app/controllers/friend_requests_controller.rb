class FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:create]
	before_action :logged_in_user

	def create
		friend = User.find(params[:friend_id])
		@friend_request = current_user.friend_requests.new(friend: friend)

		respond_to do |format|
			if @friend_request.save
				format.js {}
			else
				flash[:error] = "Could not process request."
			end
		end
	end

	def destroy
		respond_to do |format|
			if @friend_request.destroy
				format.js {}
			else
				flash[:error] = "Could not process request."
			end
		end
	end

	def update
		respond_to do |format|
			if @friend_request.accept
				format.js {}
			else
				flash[:error] = "Could not process request."
			end
		end
	end

	private

	def set_friend_request
		@friend_request = FriendRequest.find(params[:id])
	end
end
