$(document).ready(function() {
  $('#sign_up_form').hide();
  $('#screen_up_form').hide();

  $('#sign_up_btn').click(function() {
    $('#sign_up_form').toggle();
    $('#sign_up_btn').hide();
  });

  $('#screen_up_btn').click(function() {
    $('#screen_up_form').toggle();
    $('#screen_up_btn').hide();
  });
});
