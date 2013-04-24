# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#message_recipient').live 'click',(event) ->
  	$('#message_recipient').autocomplete
    	source: $('#message_recipient').data('autocomplete-source')
jQuery ->
	$('#proposal_assistant').live 'click',(event) ->
  	$('#proposal_assistant').autocomplete
    	source: $('#proposal_assistant').data('autocomplete-source')
jQuery ->
  $('#topic_proposal_attributes_student_id').live 'click',(event) ->
    $('#topic_proposal_attributes_student_id').autocomplete
      source: $('#topic_proposal_attributes_student_id').data('autocomplete-source')
jQuery -> 
  $("#new_message").click ->
    $("form[data-validate]").validate()
jQuery ->
  $('#menu_dosen li a').pjax('[data-pjax-container]')