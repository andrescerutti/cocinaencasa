import places from 'places.js';


const initAutocomplete = () => {
  const addressInput = document.querySelector('#query_address');
  const addressInput2 = document.querySelector('#order_address_address');
  if (addressInput) {
    places({ container: addressInput }).configure({
    countries: ['ar']
  });
  }
  if (addressInput2) {
    places({ container: addressInput2 }).configure({
    countries: ['ar']
  });
  }
};


export { initAutocomplete };

