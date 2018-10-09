$(function () {
  var map = L.map('welcome_map').setView([20, 0], 2);

  var CartoDB_PositronNoLabels = L.tileLayer('https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_nolabels/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="http://cartodb.com/attributions">CartoDB</a>',
    subdomains: 'abcd',
    maxZoom: 19
  }).addTo(map);



  // ---> Location markers
  var locations = $('#welcome_map').data('locations');
  var markers = [];

  $.each(locations, function (index, location) {
    var marker_options = {
      radius: 100,
      color: 'black',
      fillColor: 'green'
    };

    var marker = L.circle([location.y, location.x], marker_options).addTo(map);

    marker.bindPopup(
      "<b><a href='/location_records/" + location.id + "'>" + location.name + "</a></b>"
      + "<br/>Latitude: " + location.y
      + "<br/>Longitude: " + location.x
    );

    markers.push(marker);
  });


  // ---> Geolocation marker
  map.locate({setView: false, maxZoom: 16});

  function onLocationFound(e) {
    // Accuracy radius indicator
    var radius = e.accuracy / 2;
    L.circle(e.latlng, {radius: radius, stroke: false}).addTo(map);

    // Actual location marker
    var location_marker_options = {
      radius: 6,
      color: 'white',
      fillColor: '#3388ff',
      fillOpacity: 1,
      weight: 2
    }
    L.circleMarker(e.latlng, location_marker_options).addTo(map)
      .bindPopup("You are within " + radius + " meters of this point");
  }
  map.on('locationfound', onLocationFound);

  function onLocationError(e) {
    console.log(e.message);
  }
  map.on('locationerror', onLocationError);
});
