$(document).on('turbolinks:load', function() {
	$(document).on("mouseenter", ".liked", function () {
		$(this).find("a").html("<i class='fa fa-undo'></i>");
		$(this).removeClass("exit");
	});

	$(document).on("mouseleave", ".liked", function () {
		$(this).find("a").html("<i class='fa fa-heart'></i>");
		$(this).addClass("exit");
	});

	$(document).on("click", ".likebutton", function (event) {
		$(this).find("a")[0].click();
		event.preventDefault();
	});

	$(".liked").addClass("exit");

	$("#newpost").on("click", function() {
		$("html, body").animate({ scrollTop: 0 }, 500);
		return false;
	});
});
