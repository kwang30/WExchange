// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery-fileupload
//= require jquery-fileupload/basic
//= require jquery-fileupload/basic-plus
//= require select2
//= require select2-full
//= require pusher.min.js

//= require jquery.slick
//= require twitter/typeahead
//= require materialize-sprockets
//= require dropzone
//= require_tree .

$(document).ready( function(){
  $('.modal').modal();
  $('.datepicker').pickadate({
    selectMonths: true,
    closeOnSelect: true
  });

  $('#include_message').change(function() {
    if ($(this).is(':checked')) {
      $('.message-text-area').toggle()
    } else {
      $('.message-text-area').toggle()
    }
  });

  $('.transaction-marker-modal').on('submit', function() {
    $('.transaction-marker-modal').modal();
  });

  $('#marker_complete').change(function() {
    console.log("hello")
  });

  $('.dropdown-button').dropdown();

  $(".dropdown").select2({
      theme: "bootstrap"
  });

  $('select').material_select();
  $('select').material_select('destroy');
});

function displayDashboardTab(tabName) {
  if (tabName == "outgoing") {
    $('ul.tabs').tabs('select_tab', 'dashboard-sidebar-outgoing-requests');
  } else if (tabName == "incoming") {
    $('ul.tabs').tabs('select_tab', 'dashboard-sidebar-incoming-requests');
  }
}
