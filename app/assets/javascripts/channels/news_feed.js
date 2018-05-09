App.messages = App.cable.subscriptions.create('NewsFeedChannel', {  
  received: function(data) {
    return $('#post_feed').prepend(data.post);
  }
});