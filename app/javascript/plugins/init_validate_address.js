const validateAddress = () => {
  const address = document.querySelector("#order_addresses_address")
  const delivery = document.querySelector("#order_delivery_provider_envio_a_domicilio")
  const pickUp = document.querySelector("#order_delivery_provider_retirar_por_el_local")
  const amount = document.querySelector("#order_amount")
  const submit = document.querySelector("#submit_order_kit")
  const addressFields = document.querySelector("#address_fields")
  const storeAddress = document.querySelector("#store_address")
  const deliveryDate = document.querySelector("#order_date_delivery")

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

  const invalidArea = () => {
    return false;
  };

  const checkPickUp = () => {
    if (pickUp) {
      return pickUp.checked;
    } else {
      true
    }
  }

  const checkDelivery = () => {
    if (delivery) {
      return delivery.checked;
    } else {
      true
    }
  }

  const updateOrderButton = () => {
    if (((address.value !== "" && checkDelivery) || checkPickUp) && deliveryDate.value !== "" && amount.value > 0 && !invalidArea()) {
      submit.classList.remove("disabled")
      submit.disabled = ""
      const s = amount.value > 1 ? "s" : ""
      const price = Number.parseInt(document.querySelector("#price").dataset.price, 10)
      submit.value = `Pedir ${amount.value} kit${s} por ARS $${amount.value * price}`
    } else {
      submit.classList.add("disabled")
      submit.disabled = "disabled"
      if (address.value === "" || (pickUp.checked === false && delivery.checked === false)) {
        submit.value = `Ingrese dirección y método de envío`
      }
      else if (amount.value < 1) {
        submit.value = `Ingresar cantidad de Chef Box`
      }
      else if (invalidArea()) {
        alert("Usted a ingresado una direeción fuera de la zona de envío.")
        submit.value = `Fuera de la zona de envíos.`
      }
       else {
        submit.value = `¡Por favor revise los datos ingresados!`
      }
    }
  }

  if (submit) {
    address.addEventListener("change", event => updateOrderButton())
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
