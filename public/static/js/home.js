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
	$('.options a').click(function(event) {
		event.preventDefault();
		var self = this
		$.get(this.href, function(data) {
			if ($(self).hasClass('rsvp')) {
				$(self).removeClass('rsvp');
				$(self).addClass('unrsvp');
				var oldVal = parseInt($(self).text());
				$(self).text(oldVal + 1);
			} else if ($(self).hasClass('unrsvp')) {
				$(self).removeClass('unrsvp');
				$(self).addClass('rsvp');
				var oldVal = parseInt($(self).text());
				$(self).text(oldVal - 1);
			} else if ($(self).hasClass('like')) {
				$(self).removeClass('like');
				$(self).addClass('unlike');
				var oldVal = parseInt($(self).text());
				$(self).text(oldVal + 1);
			} else if ($(self).hasClass('unlike')) {
				$(self).removeClass('unlike');
				$(self).addClass('like');
				var oldVal = parseInt($(self).text());
				$(self).text(oldVal - 1);
			}
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