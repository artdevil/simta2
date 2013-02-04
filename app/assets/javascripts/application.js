// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require rails.validations
//= require rails.validations.simple_form
//= require twitter/bootstrap
//= require ckeditor/init
//= require ckeditor/config
//= require_tree .

$(document).ready(function(){
  if($(document).find(".alert")){
    setTimeout(function() {$('.alert').alert('close')}, 5000);
  }
  
  $("input.date_picker").datepicker({
    dateFormat: 'dd/mm/yy',
    changeMonth: true,
    changeYear: true,
  });
  
  $('.ajax').click(function(){
    $('#notification_pages_div').html('<li><a href="#">Loading...</a></li>');
  });
  
  if ($(document).length > 0) {
    setTimeout(updateComments, 10000);
  }
});

function updateComments() {
  $.getScript('/notifications/1.js');
  setTimeout(updateComments, 10000);
}

