jQuery ->
  deletedFindings = 0

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    deletedFindings++
    $(this).closest('.finding-row').hide().addClass('df' + deletedFindings)
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
  	time = new Date().getTime()
  	regexp = new RegExp($(this).data('id'), 'g')
  	$(this).parent().parent().before($(this).data('fields').replace(regexp, time))
  	$('.finding').filter(":last").focus()
  	event.preventDefault()

  $('form').on 'click', '.undo_delete_finding', (event) ->
    $('.df' + deletedFindings + " input[type=hidden]").val('false')
    $('.df' + deletedFindings).removeClass('df' + deletedFindings).show()
    deletedFindings--
    event.preventDefault()

  mindate = new Date("January 1, 2000")
  $( "#studyDate" ).COLCalendar( { minDate: mindate } )

  