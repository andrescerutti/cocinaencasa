const initReadyMade = () => {
  const readyMade = document.querySelector("#ready-made")

  if (readyMade) {
    const prepared = document.querySelector("#prepared")
    const toCook = document.querySelector("#to-cook")
    prepared.addEventListener("click", (event) => {
      prepared.classList.add("active")
      toCook.classList.remove("active")
      readyMade.value = true
    })
    toCook.addEventListener("click", (event) => {
      prepared.classList.remove("active")
      toCook.classList.add("active")
      readyMade.value = false
    })
  }
}

export { initReadyMade };
