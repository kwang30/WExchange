$(document).ready( function(){
  $('.message-users').on('click','li', function(){
    if($(this).hasClass('user-list-item')) {
      $(this).addClass('active').siblings().removeClass('active');
    }
  });
});
