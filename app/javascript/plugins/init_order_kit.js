const calculateKit = () => {
  const amount = document.querySelector("#order_amount")
  const delivery = document.querySelector("#order_delivery_provider_envio_a_domicilio")
  const city = document.querySelector("#order_addresses_city")
  const state = document.querySelector("#order_addresses_state")
  const street = document.querySelector("#order_addresses_street")
  const cp = document.querySelector("#order_addresses_cp")
  const button = document.querySelector("#submit_order_kit")
  const price = document.querySelector("#price")


  const updatePrice = () => {
    if (amount.value > 0 ) {
      button.classList.remove("disabled")
      button.disabled = ""
      if (amount.value > 1) {
        button.value = `Pedir ${amount.value} kits ($${amount.value * price.innerText})`
        button.dataset.disableWith = button.value;
      } else {
        button.value = `Pedir 1 kit ($${amount.value * price.innerText})`
        button.dataset.disableWith = button.value;
      }
    } else {
      button.classList.add("disabled")
      button.disabled = "disabled"
      button.value = `Seleccione la cantidad de Kits`
    }
  }

  if (amount) {
    amount.addEventListener("change", event => updatePrice())
    cp.addEventListener("keyup", event => updatePrice())

  }
}

export { calculateKit };
