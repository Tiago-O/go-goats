import places from 'places.js';

const initAutocompleteGoatLocation = () => {
  const registrationGoatInput = document.querySelector('.goat-location');
  if (registrationGoatInput) {
    places({ container: registrationGoatInput });
  }
};

const initAutocomplete = () => {
  const addressInput = document.querySelector('.home-form');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete, initAutocompleteGoatLocation };
