import flatpickr from "flatpickr"
import { Spanish } from "flatpickr/dist/l10n/es.js"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
require("flatpickr/dist/themes/dark.css");




  flatpickr(".datepicker", {
    defaultDate: new Date().fp_incr(0),
    altInput: true,
    altFormat: "D d-M",
    minDate: new Date().fp_incr(0),
    maxDate: new Date().fp_incr(7),
    locale: Spanish,
    disableMobile: "true"
  })



