// # app/javascript/components/form_toggler.js
const initFormToggler = () => {
  document.addEventListener('click', function(event) {
    if (event.target && event.target.classList.contains("radio_buttons")) {
      const option = event.target;
      const  nestedForm = document.getElementById('address_form');
      if (option.value == 'Glovo - Retira por el local') {
        nestedForm.style.display = 'none';
      } else {
        nestedForm.style.display = '';
      }
    }
  });
}

export { initFormToggler }

