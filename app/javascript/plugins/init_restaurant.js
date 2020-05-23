const initRestaurant = () => {
  const kitShow = document.querySelector("#kit-show")
  const restaurantShow = document.querySelector("#restaurant-show")
  const maps = document.querySelectorAll(".map-zone.map-open")

  if (restaurantShow || kitShow) {
    maps.forEach(map => {
      map.addEventListener("click", (event) => {
        const id = map.dataset.store;
        map.innerText = map.innerText === `⚠ Ver zona de envío` ? `⚠ Ocultar zona de envío` : `⚠ Ver zona de envío`
        const mapWrapper = document.querySelector(`#store-${id}`)
        mapWrapper.classList.toggle("d-none")
      })
    })
  }
}

export { initRestaurant };
