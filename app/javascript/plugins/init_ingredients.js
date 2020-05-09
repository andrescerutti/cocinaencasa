const initIngredients = () => {

  const ingredientsTrigger = document.querySelector("#ingredients-trigger")
  const ingredients = document.querySelector("#ingredients")
  const displayIngredients = () => {
    ingredients.classList.toggle("d-none")
  }

  if (ingredientsTrigger) {
    ingredientsTrigger.addEventListener("click", event => displayIngredients())
  }
}

export { initIngredients }
