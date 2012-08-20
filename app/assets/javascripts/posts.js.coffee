# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$('div.link_description div.link_thumbnail img.video_play_icon').click (event) ->
		event.preventDefault()
		id = $(this).attr('data')
		$('div#link_description_' + id).fadeOut()
		$('div#video_player_' + id).fadeIn()
