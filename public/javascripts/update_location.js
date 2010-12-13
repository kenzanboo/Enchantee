Event.observe(window, 'load', function() {
	if (navigator.geolocation) {
	  navigator.geolocation.getCurrentPosition(successCallback, errorCallback, {maximumAge:600000, timeout:6000});
	} else {
	  errorCallback()
	}
});

function successCallback(position) {
	new Ajax.Request('/users/update_location', {
		method:'post',
		parameters: {latitude: position.coords.latitude,
					 longitude: position.coords.longitude}
	})
	document.getElementById('spinner').src = "/images/located.png";
}

function errorCallback(position) {
	//set spinner to something else
}