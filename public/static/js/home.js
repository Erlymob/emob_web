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

	// intercept options links
	$('a.rsvp').click(function(event) {
		event.preventDefault();
		$.get(this.href, function(data) {
			console.log(data);
		});
	});

	// create a place mark on mouseover
	$('.map').hover(function(event) {
		if ($(this).data('latitude')) {
			var position = $(this).gmap('get','map').getCenter();
			$(this).gmap('addMarker', {
				'position': position
			}, function(map, marker) {

			});
		}
	}, function(event) {
		if ($(this).data('latitude')) {
			$(this).gmap('clear', 'markers');
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