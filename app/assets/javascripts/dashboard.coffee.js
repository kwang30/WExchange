
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
