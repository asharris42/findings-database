jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.finding-row').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
  	time = new Date().getTime()
  	regexp = new RegExp($(this).data('id'), 'g')
  	$(this).before($(this).data('fields').replace(regexp, time))
  	$('.finding').filter(":last").focus()
  	event.preventDefault()

  mindate = new Date("January 1, 2000");
  $( "#studyDate" ).COLCalendar( { minDate: mindate } );

  