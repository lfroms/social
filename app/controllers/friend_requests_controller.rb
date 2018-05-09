class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend_request, except: [:create]

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)

    respond_to do |format|
      if @friend_request.save
        ActionCable.server.broadcast "friend_requests_#{friend.id}", {
          request: render_to_string(partial: 'friend_request', locals: { friend_request: @friend_request }),
          removed: false
        }

        format.js {}
      else
        flash[:error] = "Could not process request."
      end
    end
  end

  def destroy
    respond_to do |format|
      if @friend_request.destroy
        ActionCable.server.broadcast "friend_requests_#{@friend_request.friend_id}", {
          request: render_to_string(partial: 'friend_request', locals: { friend_request: @friend_request }),
          removed: true,
          requestID: @friend_request.id
        }

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
