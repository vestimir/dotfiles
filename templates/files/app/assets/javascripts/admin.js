//= require jquery
//= require jquery_ujs
//= require turbolinks

function ready() {
  $('[data-behaviour~=datepicker]').datepicker({
    firstDay: 1,
    todayBtn: true,
    format: 'yyyy-mm-dd',
    autoclose: true
  });
}

$(document).on('page:change', ready);
