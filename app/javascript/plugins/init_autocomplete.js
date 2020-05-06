function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var addressInput = document.getElementById('query_address');
    var addressInput2 = document.getElementById('order_address_address');

    if (addressInput) {
      console.log("1")
      var autocomplete = new google.maps.places.Autocomplete(addressInput, { types: [ 'geocode', 'address'], componentRestrictions: {country: "ar"} });
      google.maps.event.addDomListener(addressInput, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }

    if (addressInput2) {
      console.log("2")
      var autocomplete = new google.maps.places.Autocomplete(addressInput2, { types: [ 'geocode', 'address'], componentRestrictions: {country: "ar"} });
      google.maps.event.addDomListener(addressInput2, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }

  });
}

export { autocomplete };
