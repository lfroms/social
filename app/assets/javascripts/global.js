$(document).on('turbolinks:load', function() {
	$(document).on("mouseenter", ".liked", function () {
		$(this).html("<i class='fa fa-undo'></i>");
	});

	$(document).on("mouseleave", ".liked", function () {
		$(this).html("<i class='fa fa-heart'></i>");
	});

	$("#newpost").on("click", function() {
		$("html, body").animate({ scrollTop: 0 }, 500);
		return false;
	});

	$(document).on({
		mouseenter: function() {
			var buttonWidth = $(this).width();

			$(this).html("<i class=\"fa fa-times\"></i> Cancel");
			$(this).width(buttonWidth);
		},
		mouseleave: function() {
			$(this).html("<i class=\"fa fa-arrow-right\"></i>Request Sent");
		}
	}, ".request-cancel");

	$(document).on({
		mouseenter: function() {

			$(this).html("<i class=\"fa fa-times\"></i> Remove");
		},
		mouseleave: function() {
			$(this).html("<i class=\"fa fa-check\"></i> Friends");
		}
	}, ".request-remove");
});

// Function for toggling the comments feed for a specific post
function toggleComments(feedID) {
	if ($(feedID).hasClass("expanded")) {
		$(feedID).removeClass("expanded");
	} else {
		$(feedID).addClass("expanded");
		$(feedID).scrollTop($(feedID)[0].scrollHeight);
	}
}
