const initAdminDashboard = () => {
  const paymentCards = document.querySelectorAll(".payment-order")

  if (paymentCards.length > 0) {

    paymentCards.forEach((card) => {
      card.addEventListener("click", (e) => {
        const id = card.dataset.order;
        document.querySelectorAll(`.order-${id}`).forEach((tag) => {
          tag.classList.toggle("d-none")
        })
      })
    })
  }
}

export { initAdminDashboard };
