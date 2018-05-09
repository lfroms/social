class NewsFeedChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'news_feed'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
