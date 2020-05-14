import { validateAddress } from "../plugins/init_validate_address";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { checkDisabledButton } from '../plugins/disable_button';
import "bootstrap";
import "../plugins/flatpickr"
import { initFormToggler } from '../plugins/form_toggler';
import { autocomplete } from '../plugins/init_autocomplete';
import { initIngredients } from '../plugins/init_ingredients';

initFormToggler();
validateAddress();
checkDisabledButton();
autocomplete();
initIngredients();
