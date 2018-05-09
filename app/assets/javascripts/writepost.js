$(document).on('turbolinks:load', function () {
	$("#new_post_add_image, .file-btn").click(function () {
		$(this).find("input[type=file]")[0].click();
	});

	$("#new_post_file").change(function () {

		var file = $('#new_post_file').val();

		if (file !== null) {
			$("#new_post_drawer").animate({ height: 50 }, 300);

			if ($('#new_post_drawer').val() !== null) {
				$($('#new_post_drawer')).empty();
			}
			$('#new_post_drawer').html("<i class='fa fa-camera'></i> &nbsp;Selected image: " + file.replace(/^.*\\/, ""));
		}
	});
});
