# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#message_recipient').autocomplete
    source: $('#message_recipient').data('autocomplete-source')
jQuery -> 
  $("#new_message").click ->
    $("form[data-validate]").validate()