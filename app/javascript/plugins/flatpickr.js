import flatpickr from "flatpickr"
import { Spanish } from "flatpickr/dist/l10n/es.js"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
require("flatpickr/dist/themes/dark.css");

let days_to_disable = []
const disabled_dates = document.querySelector("#disabled_dates")

if (disabled_dates) {
  days_to_disable = JSON.parse(disabled_dates.dataset.delivery)
}


  flatpickr(".datepicker", {
    defaultDate: new Date().fp_incr(0),
    altInput: true,
    altFormat: "D d-M",
    minDate: new Date().fp_incr(0),
    maxDate: new Date().fp_incr(7),
    locale: Spanish,
    disable: days_to_disable,
    disableMobile: "true"
  })



