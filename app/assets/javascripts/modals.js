$(function() {

	$("#newpost").click(function() {
		$("#new-post-container").show();
		$("#modal-background").addClass('visible-container');
		$("#new-post-modal").addClass('visible-modal');
		$("#newpost").addClass('active-item');

		return false;
	});

	$("#new-post-container").click(function() {
		$("#modal-background").removeClass('visible-container');
		$("#new-post-modal").removeClass('visible-modal');
		$("#newpost").removeClass('active-item');

		setTimeout(() => {
			$("#new-post-container").hide();
		}, 200);
		return false;
	});
});
