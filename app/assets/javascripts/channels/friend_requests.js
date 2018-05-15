App.messages = App.cable.subscriptions.create('FriendRequestsChannel', {  
	received: function(data) {
		if (data.removed === true) {
			$("#friend-request-" + data.requestID).remove();
			$("#num-friend-requests").text(parseInt($("#num-friend-requests").text()) - 1);

			if ($("#friend-requests-list").children().length == 0) {
				$("#friend-request-container").fadeOut(500);
			}

			return;
		}

		if ($("#friend-requests-list").children().length == 0) {
			$("#friend-request-container").fadeIn(500);
		}

		$("#num-friend-requests").text(parseInt($("#num-friend-requests").text()) + 1);
		return $("#friend-requests-list").append(data.request);
	}
});