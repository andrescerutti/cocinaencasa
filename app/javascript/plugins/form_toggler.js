// # app/javascript/components/form_toggler.js
const initFormToggler = () => {
  document.addEventListener('click', function(event) {
    if (event.target && event.target.classList.contains("radio_buttons")) {
      const option = event.target;
      const  nestedForm = document.getElementById('address_form');
      const  glovo_deliver = document.getElementById('instructions');
      const  moto_deliver = document.getElementById('moto');
      if (option.value !== 'Glovo') {
        if (option.value == 'Envío a domicilio'){
          moto_deliver.style.display = '';
          nestedForm.style.display = 'none';
          glovo_deliver.style.display = 'none';
        } else {
          nestedForm.style.display = '';
          moto_deliver.style.display = 'none';
          glovo_deliver.style.display = 'none';
        }
      } else {
          glovo_deliver.style.display = '';
        nestedForm.style.display = 'none';
        moto_deliver.style.display = 'none';

      }
    }
  });
}

export { initFormToggler }

