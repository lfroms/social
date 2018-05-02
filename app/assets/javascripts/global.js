function hasTouch() {
	return 'ontouchstart' in window
	|| navigator.maxTouchPoints
}

$(document).on('turbolinks:load', function() {
	if (!hasTouch()) {
		$(document).on("mouseenter", ".likebutton", function () {
			$(this).html("<i class='fa fa-heart'></i>");
		});

		$(document).on("mouseleave", ".likebutton", function () {
			$(this).html("<i class='fa fa-heart'></i>");
		});

		$(document).on("mouseenter", ".likebutton.liked", function () {
			$(this).html("<i class='fa fa-undo'></i>");
		});

		$(document).on("mouseleave", ".likebutton.liked", function () {
			$(this).html("<i class='fa fa-heart'></i>");
		});

	}

	$("#newpost").on("click", function() {
		$("html, body").animate({ scrollTop: 0 }, 500);
		return false;
	});

	if (hasTouch()) {
		try {
			for (var si in document.styleSheets) {
				var styleSheet = document.styleSheets[si];
				if (!styleSheet.rules) continue;

				for (var ri = styleSheet.rules.length - 1; ri >= 0; ri--) {
					if (!styleSheet.rules[ri].selectorText) continue;

					if (styleSheet.rules[ri].selectorText.match(':hover')) {
						styleSheet.deleteRule(ri);
					}
				}
			}
		} catch (ex) {}
	}

	$(".hamburger-container").on("click", function() {
		$(".side-nav").toggleClass("visible");
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
