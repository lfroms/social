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
