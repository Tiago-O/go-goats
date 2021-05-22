import places from 'places.js';

const initAutocomplete = () => {
  const searchInputs = document.querySelectorAll('[data-js="search"]');

  searchInputs.forEach(input => {
    const autocomplete = places({ container: input });

    if (input.dataset.homesearch) {
      autocomplete.on('change', event => {
        const { suggestion } = event;
        // SAME AS: const suggestion = event.suggestion;

        const { latlng } = suggestion;
        const { lat, lng } = latlng;
        const latlong = `${lat},${lng}`;

        const form = input.closest('form');

        form.addEventListener('submit', (event) => {
          event.preventDefault();
          window.location = `/goats?coords=${latlong}`;
        });

        window.location = `/goats?coords=${latlong}`;
      });
    }
  });
};

export { initAutocomplete };
