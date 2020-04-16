// # app/javascript/components/form_toggler.js
const initFormToggler = () => {
  document.addEventListener('click', function(event) {
    if (event.target && event.target.classList.contains("radio_buttons")) {
      const option = event.target;
      const  nestedForm = document.getElementById('address_form');
      const  glovo_deliver = document.getElementById('instructions');
      const  pickup = document.getElementById('pickup');

      if (option.value !== 'Glovo') {
        if (option.value == 'Retirar por el local'){
          nestedForm.style.display = 'none';
          pickup.style.display = '';
          glovo_deliver.style.display = 'none';
        } else {
          pickup.style.display = 'none';
          nestedForm.style.display = '';
          glovo_deliver.style.display = 'none';
        }
      } else {
          glovo_deliver.style.display = '';
          nestedForm.style.display = 'none';
          pickup.style.display = 'none';
      }
    }
  });
}

export { initFormToggler }

