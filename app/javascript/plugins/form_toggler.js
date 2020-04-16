// # app/javascript/components/form_toggler.js
const initFormToggler = () => {
  const  pickup = document.getElementById('pickup');
  if (pickup) {
    document.addEventListener('click', function(event) {
      if (event.target && event.target.classList.contains("radio_buttons")) {
        const  nestedForm = document.getElementById('address_form');
        const option = event.target;
        const  glovo_deliver = document.getElementById('instructions');

        if (nestedForm) {
          if (option.value == 'Retirar por el local'){
            nestedForm.style.display = 'none';
            pickup.style.display = '';
          } else {
            pickup.style.display = 'none';
            nestedForm.style.display = '';
          }
        } else {
          if (option.value == 'Retirar por el local'){
            glovo_deliver.style.display = 'none';
            pickup.style.display = '';
            } else {
            pickup.style.display = 'none';
            glovo_deliver.style.display = '';
          }
        }
      }
    })
  }
}

export { initFormToggler }

