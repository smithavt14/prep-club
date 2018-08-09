// BING MAPS JS

// console.log("hello");
// function GetMap() {
//   var map = new Microsoft.Maps.Map('#map', {
//     credentials: 'ArvQMgGzEIj2nu_H_WikEcvn6gWeizwFhbT75bwTFfCWXaabATCIvmT4qI_PqP4x'
//   });
//   map.setView({
//     mapTypeId: Microsoft.Maps.MapTypeId.aerial,
//     center: new Microsoft.Maps.Location(35.027222, -111.0225),
//     zoom: 15
//     //Add your post map load code here.
//   })
//   // var locs = [array of Microsoft.Maps.Location];
//   // var rect = Microsoft.Maps.LocationRect.fromLocations(locs);
//   // map.setView({ bounds: rect, padding: 80 });
// }

// GetMap();






// BAIDU MAPS JS
// var map = new BMap.Map("map");
// var point = new BMap.Point(116.404, 39.915);// Create a map instance
// var point = new BMap.Point(116.404, 39.915);
// var point2 = new BMap.Point(116.367937687201, 23.5409788218461)
// map.centerAndZoom(point, 15);
// // map.centerAndZoom(point, 15); // Initialize the map, Set center point coordinates and map level
// map.addControl(new BMap.NavigationControl());
// map.enableScrollWheelZoom(true);
// marker = [new BMap.Marker(point2), new BMap.Marker(point)]
// // var marker = new BMap.Marker(point2); // Create annotation
// // var marker1 = new BMap.Marker(point); // Create annotation
// map.addOverlay(new BMap.Marker(point2));


// MAPBOX JS
// const mapElement = document.getElementById('map');
// if (mapElement) {
//   const markers = JSON.parse(mapElement.dataset.markers);
//   console.log(markers);
//   markers.forEach(function(marker) {
//     var point = new BMap.Point(marker.lat, marker.lng);
//     const marker = new BMap.Marker(point);
//     map.addOverlay(marker);
//     }
//     // create a HTML element for each feature
//     var el = document.createElement('div');
//     el.className = 'marker';
//     console.log(new mapboxgl.Marker(el))
//     new mapboxgl.Marker(el)
//     .setLngLat([marker.lng, marker.lat])
//     .setPopup(new mapboxgl.Popup({ offset: 25 })
//     .setHTML('<h3> pe' + marker.name + '</h3><p>' + marker.location + '</p>'))
//     .addTo(map);
// })
// };


