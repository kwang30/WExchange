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
//= require pusher.min.js
//= require nouislider
//= require mixitup
//= require select2

//= require twitter/typeahead
//= require materialize-sprockets
//= require dropzone
//= require multi-select

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

function displayDashboardTab(tabName) {
  if (tabName == "outgoing") {
    $('ul.tabs').tabs('select_tab', 'dashboard-sidebar-outgoing-requests');
  } else if (tabName == "incoming") {
    $('ul.tabs').tabs('select_tab', 'dashboard-sidebar-incoming-requests');
  }
}


$(function () {
  $("#user_search").on('keyup', function () {
    $.get($("#discover-search-form").attr("action"), $("#discover-search-form").serialize(), null, "script");
    return false;
  });
});

$(function () {
  $("#tag_search").on('keyup', function () {
    $.get($("#discover-search-form").attr("action"), $("#discover-search-form").serialize(), null, "script");
    return false;
  });
});

$(".tag_search").select2();
$(document).ready(function() {
  $('select#box_assoc_items').select2({
    placeholder: 'choose items',
    multiple: true
  });
});


$(document).ready(function() {
    $('select').material_select();
});

$(".select2").select2({
  tags: true,
  tokenSeparators: [",", " "],
  createSearchChoice: function(term, data) {
    if ($(data).filter(function() {
      return this.text.localeCompare(term) === 0;
    }).length === 0) {
      return {
        id: term,
        text: term
      };
    }
  },
  multiple: true,
  ajax: {
    url: '/discover/results.json',
    dataType: "json",
    data: function(term, page) {
      return {
        q: term
      };
    },
    results: function(data, page) {
      return {
        results: data
      };
    }
  }
});
