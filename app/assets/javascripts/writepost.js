$(document).on('turbolinks:load', function () {
	$("#new_post_add_image").click(function () {
		$("#new_post_drawer").animate({ height: 100 }, 300);
	});
});
