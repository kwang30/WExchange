$(document).ready( function(){
  $('.message-users').on('click','li', function(){
     $(this).addClass('active').siblings().removeClass('active');
  });
});
