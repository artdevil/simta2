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
//= require jquery.pjax
//= require jquery.remotipart
//= require jquery.ui.all
//= require twitter/bootstrap
//= require jquery_nested_form
//= require rails.validations
//= require rails.validations.simple_form
//= require rails.validations.nested_form
//= require ckeditor/init
//= require ckeditor/config
//= require messages

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
  
  $('.btn.btn-info.ajax_button').click(function(){
    $(this).button('loading');
  });
  
  
  if($(document).length > 0) {
    setTimeout(updateComments, 10000);
  }
  
  
  $('form').on('nested:fieldAdded', function(event) {
    $(event.target).find(':input').enableClientSideValidations();
  });
  
  $('.tool-tip').tooltip({
    placement: 'bottom'
  });
  $('.pop-over').popover({
    html: true
  });
  
  $('.modal_bimbingan_call').click(function(){
    $('#modal_bimbingan_proposal').html('<div style="width: 100%;text-align: center;"><img src="/assets/loading.gif" alt="Loading"></div>');
  });
  
  $('#proposal_student').change(function(){
    if($(this).val() != ""){
      $(this).parent().parent().parent().parent().find('form').submit();
      $('#data_mahasiswa').html('<div style="width: 100%;text-align: center;"><img src="/assets/loading.gif" alt="Loading"></div>');
      $('#todo_mahasiswa').html('<div style="width: 100%;text-align: center;"><img src="/assets/loading.gif" alt="Loading"></div>');
    }
  });
  
  $(".brand-custom").click(function () {
    $($(this).attr('data-target')).toggle();
  });

  $('.advanced').click(function(){
    $($(this).attr('data-target')).show();
    $(this).hide();
  });
  
});


function updateComments() {
  if($('#number_notification').hasClass('open') == false){
    $.getScript('/notifications/1.js');
  }
  setTimeout(updateComments, 10000); 
}

