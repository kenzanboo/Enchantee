Event.observe(window, 'load', function() {
	if (navigator.geolocation) {
	  navigator.geolocation.getCurrentPosition(successCallback, errorCallback, {maximumAge:600000, timeout:30000});
	} else {
	  errorCallback()
	}
});

function successCallback(position) {
	new Ajax.request('/users/update_location', {
		method:'post',
		parameters: {latitude: position.coords.latitude,
					 longitude: position.coords.longitude}
	})
}

function errorCallback(position) {
	//set spinner to something else
}
/*
function successCallback(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;

	new Ajax.Request('/users/set_latitude', { 
		method:'post',
		parameters: { latitude: latitude}, 

	});

	new Ajax.Request('/users/set_longitude', { 
		method:'post',
		parameters: { longitude: longitude}, 
	});

	document.getElementById('spinner').src = "/images/located.png";
}
*/