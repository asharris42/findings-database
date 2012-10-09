$(document).ready(function() {

	$('.sorter').click(function() {
		if ($(this).hasClass('desc')) {
			sortedAsc = true;
		} else {
			sortedAsc = false;
		}

		$('.sort').removeClass('desc').removeClass('asc').removeClass('sort');
		classToSort = $(this).attr('id');

		if (sortedAsc) {
			$('div>ul.table-data-row').tsort('li.'+classToSort, {order:'desc'});
			$(this).addClass('asc').addClass('sort');
		} else {
			$('div>ul.table-data-row').tsort('li.'+classToSort, {order:'asc'});
			$(this).addClass('desc').addClass('sort');
		}
	});

	if ($('.all-findings').length) {
		$('div>ul.table-data-row').tsort('li.date', {order:'desc'});
		$('#date').addClass('sort').addClass('asc');
	}

	if ($('.search-findings').length) {
		$('div>ul.table-data-row').tsort('li.study', {order:'asc'});
		$('#study').addClass('sort').addClass('desc');
	}

});
