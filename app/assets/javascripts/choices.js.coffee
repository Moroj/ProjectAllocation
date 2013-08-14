# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

	cells = $('.table').find('tr')[0].cells.length
	desired_width = 940 / cells + 'px'
	$('.table td').css('width', desired_width)
	
	
	
	$("#choices tbody").sortable(
		
		handle: '.handle'
		containment: "parent"
		stop: (e, ui) ->
			ui.item.children('td').effect('highlight', {}, 1000)
		headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
		update: ->
			$.ajax({
				type: 'post'
				data: $(this).sortable('serialize')
				headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
				url: $(this).data("update-url")
			})
		    
	)
		
