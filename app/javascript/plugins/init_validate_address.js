const validateAddress = () => {
  const address = document.querySelector("#order_addresses_address")
  const delivery = document.querySelector("#order_delivery_provider_envio_a_domicilio")
  const pickUp = document.querySelector("#order_delivery_provider_retirar_por_el_local")
  const amount = document.querySelector("#order_amount")
  const submit = document.querySelector("#submit_order_kit")

  const invalidArea = () => {
    return false;
  };

  const updateOrderButton = () => {
    if (address.value !== "" && (pickUp.checked || delivery.checked) && amount.value > 0 && !invalidArea()) {
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
    pickUp.addEventListener("change", event => updateOrderButton())
    delivery.addEventListener("change", event => updateOrderButton())
    amount.addEventListener("change", event => updateOrderButton())
  }

}

export { validateAddress };
