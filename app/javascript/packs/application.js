import { validateAddress } from "../plugins/init_validate_address";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { checkDisabledButton } from '../plugins/disable_button';
import "bootstrap";
import "../plugins/flatpickr"
import { initFormToggler } from '../plugins/form_toggler';
import { autocomplete } from '../plugins/init_autocomplete';
import { initIngredients } from '../plugins/init_ingredients';
import { initGoogleAnalytics } from '../plugins/init_ga';
import { initCashPayment } from '../plugins/init_cash_payment';
import { initRestaurant } from '../plugins/init_restaurant';
import { initAdminDashboard } from '../plugins/init_admin_dashboard';

initFormToggler();
validateAddress();
checkDisabledButton();
autocomplete();
initIngredients();
initGoogleAnalytics();
initCashPayment();
initRestaurant();
initAdminDashboard();
