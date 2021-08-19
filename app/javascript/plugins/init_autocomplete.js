import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('search_address');
  if (addressInput) {
    places({ container: addressInput });
  }

  const addressInput_2 = document.getElementById('pokespot_address');
  if (addressInput_2) {
    places({ container: addressInput_2 });
  }

};

export { initAutocomplete };
