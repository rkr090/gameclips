$(document).ready(function() {
  $('#frm-collapse').hide();

  $('#frm-btn').click(function() {
    $('#frm-collapse').toggle();
    $('#frm-btn').hide();
  });

  $('#new-scr-form').hide();

  	$('#new-scr-button').click(function(){

  		$('#new-scr-form').toggle();

  	});
});
