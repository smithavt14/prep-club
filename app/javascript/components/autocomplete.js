function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var prepLocation = document.getElementById('prep_location');

    if (prepLocation) {
      var autocomplete = new google.maps.places.Autocomplete(prepLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(prepLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
