
function searchData() {
  $.get($("#discover-search-form").attr("action"), $("#discover-search-form").serialize(), null, "script");
  return false;
}


function searchData() {
  $.get($("#discover-search-form").attr("action"), $("#discover-search-form").serialize(), null, "script");
  return false;
}
$(function () {
  $("#user_search").on('keyup', function () {
    $.get($("#discover-search-form").attr("action"), $("#discover-search-form").serialize(), null, "script");
    return false;
  });
});
