
$(document).ready(function() {
  $('.dashboard-notification-item').click(function() {
    $.ajax({
        url: 'notifications/mark_as_read',
        type: 'POST',
        data: { 'notification_id': $(this).closest("li").data("id") },
        success: function(){
          $.ajax({
            url: '/notifications/update',
            type: "POST"
          });

          $.ajax({
            url: '/navigation/update',
            type: "POST"
          });
        }
    });
  });

  $(".include-message-check-box").change(function() {
    $(".response-textarea").toggle();
  });

  $(".creator-accept-button").click(function() {
    $(".price-text-field").attr("required", "true");
    console.log("Set TRUE");
  });

  $(".creator-decline-button").click(function() {
    $(".price-text-field").removeAttr("required");
    console.log("Set FALSE");
  });


});

<script type="text/javascript">
      $(".myselect").select2();
</script>
<script>

$(document).ready(function() {
  $('select#box_assoc_items').select2({
    placeholder: 'choose items',
    multiple: true
  });
});
</script>
</script>
<script>

$(function () {
  $("#user_search").on('keyup', function () {
    $.get($("#discover-search-form").attr("action"), $("#discover-search-form").serialize(), null, "script");
    return false;
  });
});

$(function () {
  $("#tag_search").on('change', function () {
    $.get($("#discover-search-form").attr("action"), $("#discover-search-form").serialize(), null, "script");
    return false;
  });
});


$("#tag_search").select2();
$(document).ready(function() {
  $('select#box_assoc_items').select2({
    placeholder: 'choose items',
    multiple: true
  });
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
