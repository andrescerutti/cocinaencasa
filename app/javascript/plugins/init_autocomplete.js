function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var addressInput = document.getElementById('query_address');
    var addressInput2 = document.getElementById('order_address_address');
    var orderAddressInput = document.getElementById('order_addresses_address');

    if (addressInput) {
      var autocomplete = new google.maps.places.Autocomplete(addressInput, { types: [ 'geocode'], componentRestrictions: {country: "ar"} });
      google.maps.event.addDomListener(addressInput, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }

    if (addressInput2) {
      var autocomplete = new google.maps.places.Autocomplete(addressInput2, { types: [ 'geocode' ], componentRestrictions: {country: "ar"} });
      google.maps.event.addDomListener(addressInput2, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }
  });
}

export { autocomplete };
