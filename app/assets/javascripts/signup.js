let emailIsValid = false;
let nameIsValid = false;
let passwordIsValid = false;

$(document).on('turbolinks:load', function() {
	$('#slides').fullpage({
		controlArrows: false,
		loopBottom: false,
		loopTop: false,
		loopHorizontal: false,
		onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex) {
			check(anchorLink, index, slideIndex, direction, nextSlideIndex);
		},

		afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex) {
			check(anchorLink, index, slideIndex);
		}
	});

	$("#prev_slide").addClass("hiddenbutton").removeClass("visiblebutton");
	$("#next_slide").addClass("hiddenbutton").removeClass("visiblebutton");

	$("#setup_email_box").on('input',function(e) {
		if(!validateEmail($(this).val())) {
			$(this).css("background", "#ef9a9a")
			$("#next_slide").addClass("hiddenbutton").removeClass("visiblebutton");
			emailIsValid = false;
		} else {
			$(this).css("background", "white");
			$("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");

			emailIsValid = true;
		}
	});

	$("#setup_name_box").on('input',function(e) {
		if(!validateFullName($(this).val())) {
			$("#next_slide").addClass("hiddenbutton").removeClass("visiblebutton");
			nameIsValid = false;
		} else {
			$("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");

			nameIsValid = true;
		}
	});

	let isValidInitialPassword = false;

	$("#setup_password_box").on('input',function(e) {
		if(!validatePassword($(this).val())) {
			isValidInitialPassword = false;
		} else {
			isValidInitialPassword = true;
			$(this).css("background", "white")
		}
	});

	$("#setup_password_box").focusout(function() {
		if (!isValidInitialPassword) {
			$(this).css("background", "#ef9a9a");
		} else {
			$(this).css("background", "white")
		}
	})

	$("#setup_password_confirm_box").on('input',function(e) {
		if(!validateMatchingPassword($(this).val(), $("#setup_password_box").val())) {
			$(this).css("background", "#ef9a9a")
			$("#next_slide").addClass("hiddenbutton").removeClass("visiblebutton");
			passwordIsValid = false;
		} else {
			if (isValidInitialPassword) {
				$(this).css("background", "white");
				$("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");

				passwordIsValid = true;
			} else {
				$(this).css("background", "#ef9a9a")
				$("#next_slide").addClass("hiddenbutton").removeClass("visiblebutton");
				passwordIsValid = false;
			}
		}
	});
});

function check(anchorLink, index, slideIndex, nextSlideIndex) {
	$("#prev_slide").addClass("hiddenbutton").removeClass("visiblebutton");
	$("#next_slide").addClass("hiddenbutton").removeClass("visiblebutton");

	if (slideIndex == 0 || index == 0) {
		$("#prev_slide").addClass("hiddenbutton").removeClass("visiblebutton");
	} else {
		$("#prev_slide").removeClass("hiddenbutton").addClass("visiblebutton");
	}

	if (slideIndex == $('#slides .slide').length  - 1 || index == $('#slides .slide').length - 1) {
		$("#next_slide").hide();
		$("#finish_setup").show();
	} else {
		$("#next_slide").show();
		$("#finish_setup").hide();
	}

	if (slideIndex == 3) {
		$("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");
	}

	if (slideIndex == 0) {
		if (nameIsValid) $("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");
	} else if (slideIndex == 1) {
		if (emailIsValid) $("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");
	} else if (slideIndex == 2) {
		if (passwordIsValid) $("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");
	} else {
		$("#next_slide").removeClass("hiddenbutton").addClass("visiblebutton");
	}
}

function validateEmail($email) {
	let emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	return emailReg.test( $email );
}

function validateFullName($name) {
	if ($name.length > 1) return true; else return false;
}

function validatePassword($password) {
	if ($password.length > 4) return true; else return false;
}

function validateMatchingPassword($password1, $password2) {
	if ($password1 === $password2) return true; else return false;
}
