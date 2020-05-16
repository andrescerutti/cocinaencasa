const initGoogleAnalytics = () => {
  const orderSubmit = document.querySelector("#submit_order_kit")
  const paymentButton = document.querySelector(".mercadopago-button")

  if (orderSubmit) {
    orderSubmit.addEventListener("click", (event) => {
      gtag('event', 'Creadas', {
           'event_category': "Ordenes",
           'event_label': 'Order Submit'
          });
    })
  }

  if (paymentButton) {
    paymentButton.addEventListener("click", (event) => {
      gtag('event', 'Pagadas', {
           'event_category': 'Ordenes',
           'event_label': 'Payment Submit'
          });
    })
  }
}

export { initGoogleAnalytics };
