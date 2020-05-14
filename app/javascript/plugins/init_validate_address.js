const validateAddress = () => {
  const address = document.querySelector("#order_addresses_address")
  const delivery = document.querySelector("#order_delivery_provider_envio_a_domicilio")
  const pickUp = document.querySelector("#order_delivery_provider_retirar_por_el_local")
  const amount = document.querySelector("#order_amount")
  const submit = document.querySelector("#submit_order_kit")
  const addressFields = document.querySelector("#address_fields")
  const storeAddress = document.querySelector("#store_address")
  const deliveryDate = document.querySelector("#order_date_delivery")
  const autocomplete = new google.maps.places.Autocomplete(address, { types: [ 'geocode' ]});
  const geocoder = new google.maps.Geocoder();
  const poligono = document.querySelector("#poligono")

  function addressIsValid() {
    return new Promise(resolve => {
      const polygonCoords = JSON.parse(poligono.dataset.coordinates);
      if (polygonCoords.length === 0) {
        resolve(true)
      } else {
        geocoder.geocode( { 'address': address.value}, function(results, status) {
          if (status == 'OK') {
            const restrictedArea = new google.maps.Polygon({paths: polygonCoords});
            const result = google.maps.geometry.poly.containsLocation(results[0].geometry.location, restrictedArea) ? true : false;
            resolve(result);
          } else {
            resolve(false);
          }
        })
      }
    });
  }

  const displayStoreAddress = () => {
    if (pickUp) {
      if (pickUp.checked) {
        storeAddress.classList.remove("hide-store-address")
      }
      if (!pickUp.checked) {
        storeAddress.classList.add("hide-store-address")
      }
    }
    if (delivery) {
      if (delivery.checked) {
        addressFields.classList.remove("hide-field-address")
      }
      if (!delivery.checked) {
        addressFields.classList.add("hide-field-address")
      }
    }
  }

  const checkPickUp = () => {
    if (pickUp) {
      return pickUp.checked;
    } else {
      return false
    }
  }

  const checkDelivery = () => {
    if (delivery) {
      return delivery.checked;
    } else {
      return false
    }
  }

  const updateOrderButton = () => {
    if (((address.value !== "" && checkDelivery()) || checkPickUp()) && deliveryDate.value !== "" && amount.value > 0) {
      if (checkPickUp()) {
        submit.classList.remove("disabled")
        submit.disabled = ""
        const s = amount.value > 1 ? "s" : ""
        const price = Number.parseInt(document.querySelector("#price").dataset.price, 10)
        submit.value = `Pedir ${amount.value} kit${s} por ARS $${amount.value * price}`
      } else {
        addressIsValid().then((response) => {
          if (response) {
            submit.classList.remove("disabled")
            submit.disabled = ""
            const s = amount.value > 1 ? "s" : ""
            const price = Number.parseInt(document.querySelector("#price").dataset.price, 10)
            submit.value = `Pedir ${amount.value} kit${s} por ARS $${amount.value * price}`
          }
          else {
            submit.classList.add("disabled")
            submit.disabled = "disabled"
            submit.value = `¡Revise la zona y días habilitados!`
          }
        })
      }
    } else {
      submit.classList.add("disabled")
      submit.disabled = "disabled"
      if (address.value === "" || (checkPickUp() && checkDelivery())) {
        submit.value = `Ingrese dirección y método de envío`
      }
      else if (amount.value < 1) {
        submit.value = `Ingresar cantidad de Chef Box`
      }
      else {
        submit.value = `¡Por favor revise los datos ingresados!`
      }
    }
  }

  if (submit) {
    address.addEventListener("blur", event => updateOrderButton())
    if (pickUp) {
      pickUp.addEventListener("change", event => updateOrderButton())
      pickUp.addEventListener("change", event => displayStoreAddress())
    }
    if (delivery) {
      delivery.addEventListener("change", event => updateOrderButton())
      delivery.addEventListener("change", event => displayStoreAddress())
    }
    amount.addEventListener("change", event => updateOrderButton())
    deliveryDate.addEventListener("change", event => updateOrderButton())
  }

}

export { validateAddress };
