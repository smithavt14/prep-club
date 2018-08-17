import "bootstrap";

import "../plugins/flatpickr"

import swal from 'sweetalert';

import GMaps from 'gmaps/gmaps.js';

import { wechatPopUp } from '../components/wechatpopup';

wechatPopUp();

import { autocomplete } from '../components/autocomplete';

autocomplete();

import { recipesearch } from '../components/recipesearch';

recipesearch();

import { popupsearch } from '../components/popupsearch';

popupsearch();

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 31.2316207885742, lng: 121.48461151123 });
  map.setZoom(12);
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(13);
  } else {
    map.fitLatLngBounds(markers);
  }
}
