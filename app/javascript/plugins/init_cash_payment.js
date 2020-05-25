const initCashPayment = () => {
  const cashPayment = document.querySelector("#new_payment")
  const paymentIdentity = document.querySelector("#payment-identity")
  const paymentSpinner = document.querySelector("#payment-spinner")
  const paymentCertified = document.querySelector("#payment-certified")
  const dniPayment = document.querySelector("#dni-payment")
  const namePayment = document.querySelector("#name-payment")
  const submitCashPayment = document.querySelector("#cash-payment")

  const cashPaymentClick = (e) => {
    e.preventDefault();
    paymentIdentity.classList.add("d-none")
    paymentIdentity.classList.remove("d-flex")
    paymentSpinner.classList.remove("d-none")
    setTimeout(() => {
      paymentSpinner.classList.remove("d-flex")
      paymentSpinner.classList.add("d-none")
      paymentCertified.classList.remove("d-none")
      paymentCertified.classList.add("d-flex")
      cashPayment.removeEventListener("submit", cashPaymentClick)
    }, 2000)
    setTimeout(() => cashPayment.submit(), 3000)
  }

  const checkFilled = () => {
    if (dniPayment.value !== "" && namePayment.value !== "") {
      submitCashPayment.disabled = ""
    } else {
      submitCashPayment.disabled = "disabled"
    }
  }

  if (cashPayment) {
    cashPayment.addEventListener("submit", cashPaymentClick)
    dniPayment.addEventListener("change", checkFilled)
    namePayment.addEventListener("change", checkFilled)
  }


}

export { initCashPayment };
