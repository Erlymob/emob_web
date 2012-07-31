$(document).ready(function() {

	// set up the maps
	$('.map').each(function(index) {
		var latitude = $(this).data("latitude");
		var longitude = $(this).data("longitude");
		var position = new google.maps.LatLng(latitude, longitude);

		if (latitude != "" && longitude != "") {
			$(this).gmap({
				'center': position,
				'zoom': 12
			});

			/*$(this).gmap('addMarker', {
				'position': position
			}, function(map, marker) {

			});*/
		}
	});

	/*
	$('.map').click(function() {
		if ($(this).data("focused") == "false") {
			$(this).animate({
				height: 400
			}, 500, function() {
				$(this).data("focused", "true");
			});
		} else {
			$(this).animate({
				height: 200
			}, 500, function() {
				$(this).data("focused", "false");
			});
		}
	});
	*/
});