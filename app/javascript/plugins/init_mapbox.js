import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  const markerObjs = []

  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const markerObj = new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);

    markerObj._element.addEventListener("mouseenter", () => {
      markerObj._element.click();
    })
    markerObj.id = marker.id
    markerObjs.push(markerObj)
  });
  return markerObjs
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    const markerObjs = addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));

    document.querySelectorAll(".card-category").forEach((card) => {
      card.addEventListener("mouseenter", () => {
        const lifestyleId = card.dataset.id

        markerObjs.forEach((marker) => {
          if (marker.id == lifestyleId) {
            marker._element.querySelector("svg > g > g:nth-child(2)").setAttribute("fill", "red")
          } else {
            marker._element.querySelector("svg > g > g:nth-child(2)").setAttribute("fill", "#3FB1CE")
          }
        })
      });

      card.addEventListener("mouseleave", () => {
        markerObjs.forEach((marker) => {
          marker._element.querySelector("svg > g > g:nth-child(2)").setAttribute("fill", "#3FB1CE")
        })
      });
    });
  }
};


export { initMapbox };
