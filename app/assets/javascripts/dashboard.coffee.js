
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
});
