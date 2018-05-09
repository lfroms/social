class NewsFeedChannel < ApplicationCable::Channel
  def subscribed
    stream_from "news_feed_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
