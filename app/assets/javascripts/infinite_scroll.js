// Loads more content when scrolling down and hides static pagination

$(document).on('turbolinks:load', function() {
	var isLoading = false;

	if ($('#infinite-scrolling').length > 0) {

		$(window).on('scroll', function() {
			var more_posts_url = $('.pagination a.next_page').attr('href');

			if (!isLoading && more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
				isLoading = true;

				$.getScript(more_posts_url).done(function (data,textStatus,jqxhr) {
					isLoading = false;
				}).fail(function() {
					isLoading = false;
				});
			}
		});
	}
});
