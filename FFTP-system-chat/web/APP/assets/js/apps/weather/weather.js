// WEATHER JS CONTROLER
/* GET POSITION from browser/
    if error/null -> getPosition() where get position with IP client
 result set( lan, lon) to weather function:
 function{ ajax connect ot openWeather with data }
 return data -> select city, temp, temp_up, temp_down,  vetur m/s , icon_number,
 add to DIV classes
*/


window.onload =  geoFindMe(); // on startup

function geoFindMe() {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    console.log("Geolocation is not supported by your browser. ");
    getPosition();
    return;
  }

  function success( position ) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    loadWeather( latitude, longitude );
  }

  function error() {
    console.log("Unable to retrieve your location");
    getPosition();
  }

  navigator.geolocation.getCurrentPosition( success, error );
}

function getPosition(){
  $.ajax({
		url: "http://ip-api.com/json",
		type: "GET",
		success: function( positionByIp ){
      loadWeather( positionByIp.lat  , positionByIp.lon );
		},
		error: function( error ){
			$(".error").text( "Error find position" );
		}
	});
}

function loadWeather( lat, lon ){
	$.ajax({
		url: "http://api.openweathermap.org/data/2.5/weather",
		type: "GET",
		data: {
			lat: lat,
			lon: lon,
			units: "metric",
			appid: "a3e7bdc246b811691b06aab13ccb0dbb"
		},
		success: function( _result ){
			city = _result.name;
			temp = _result.main.temp + '&deg;';
			wcode = '<img class="weathericon" src="../assets/weather/icon/'+ _result.weather[0].icon +'.svg">'; // weather.0.id
			wind = '<p>' + _result.wind.speed + '</p>' ;
			humidity = _result.main.humidity + '%';

      // navigate DIV classes
			$(".location").text(city);
			$(".temperature").html(temp);
			$(".climate_bg").html(wcode);
			$(".windspeed").html(wind);
			$(".humidity").text(humidity);

		},
		error: function( error ){
			$(".error").text("Error load weather");
		}
	});
}
