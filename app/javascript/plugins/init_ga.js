const initGoogleAnalytics = () => {
  const orderSubmit = document.querySelector("#submit_order_kit")
  const paymentButton = document.querySelector(".mercadopago-button")

  if (orderSubmit) {
    orderSubmit.addEventListener("click", (event) => {
      ga('send', 'event', 'Ordenes', 'Creadas', 'Order Submit');
    })
  }

  if (paymentButton) {
    paymentButton.addEventListener("click", (event) => {
      ga('send', 'event', 'Ordenes', 'Pagadas', 'Payment Submit');
    })
  }
}

export { initGoogleAnalytics };
