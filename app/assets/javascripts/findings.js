$(document).ready(function() {	

	productsSearched = [];
	$('.productSearchData').each(function() {
		productsSearched.push($(this).data('searched'));
	});
	$('.productSearchSelect').val(productsSearched);

	platformsSearched = [];
	$('.platformSearchData').each(function() {
		platformsSearched.push($(this).data('searched'));
	});
	$('.platformSearchSelect').val(platformsSearched);

	studiesSearched = [];
	$('.studySearchData').each(function() {
		studiesSearched.push($(this).data('searched'));
	});
	$('.studySearchSelect').val(studiesSearched);

	tagsSearched = [];
	$('.tagSearchData').each(function() {
		tagsSearched.push($(this).data('searched'));
	});
	$('.tagSearchSelect').val(tagsSearched);

	activityTypesSearched = [];
	$('.activity_typeSearchData').each(function() {
		activityTypesSearched.push($(this).data('searched'));
	});
	$('.activity_typeSearchSelect').val(activityTypesSearched);

	$('.productSearchSelect').multiselect({noneSelectedText: 'Any',selectedList: 3}); 
      
	$('.platformSearchSelect').multiselect({noneSelectedText: 'Any',selectedList: 4});

	$('.studySearchSelect').multiselect({noneSelectedText: 'Any',selectedList: 2});

	$('.tagSearchSelect').multiselect({noneSelectedText: 'Any',selectedList: 2});

	$('.activity_typeSearchSelect').multiselect({noneSelectedText: 'Any',selectedList: 2});

	$('form').submit(function() {
		$('.ui-multiselect-checkboxes input').removeAttr('name');
	});
});