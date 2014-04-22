$(document).on("page:load", function(){
	$(".btn").click(function(){
		if ($(".attend").hasClass("hide")){
			$(".attend").removeClass("hide");
			$(".btn").text("Show Attendees");
		} else {
			$(".attend").addClass("hide");
			$(".btn").text("Hide Attendees");
		}
	});
});
