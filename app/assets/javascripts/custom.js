$(document).ready(function() {
	$('.sorter').click(function() {
		classToSort = $(this).attr('id');
		$('div>ul.table-data-row').tsort('li.'+classToSort);
	})
});
