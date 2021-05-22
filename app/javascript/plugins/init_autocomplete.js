import places from 'places.js';

const initAutocomplete = () => {
  const searchInputs = document.querySelectorAll('[data-js="search"]');

  searchInputs.forEach(input => {
    places({ container: input });
  });
};

export { initAutocomplete };
