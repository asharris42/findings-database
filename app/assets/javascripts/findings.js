$(document).ready(function() {	

	$('#product_product_name').multiselect({noneSelectedText: 'Any',classes: "productSearchSelect",selectedList: 3,}); 
      
	$('#platform_platform_name').multiselect({noneSelectedText: 'Any',classes: "platformSearchSelect",selectedList: 4,});

	$('.studySearchSelect').multiselect({noneSelectedText: 'Any',selectedList: 2,});

	$('#tag_tag_name').multiselect({noneSelectedText: 'Any',classes: "tagSearchSelect",selectedList: 2,});

	$('#activity_type_type_name').multiselect({noneSelectedText: 'Any',classes: "activityTypeSearchSelect",selectedList: 2,});


});