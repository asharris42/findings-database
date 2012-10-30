$(document).ready(function() {	

	mindate = new Date("January 1, 2000");
  $( "#studyStartDate" ).COLCalendar( { minDate: mindate } );
  $( "#studyEndDate" ).COLCalendar( { minDate: mindate } );

  $( ".clearStartDateLink" ).click(function(event) {
  	$('#studyStartDate').val('');
  	event.preventDefault();
  });

  $( ".clearEndDateLink" ).click(function(event) {
  	$('#studyEndDate').val('');
  	event.preventDefault();
  });

});