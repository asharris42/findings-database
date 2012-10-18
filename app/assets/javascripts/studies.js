$(document).ready(function() {

	$('#study_product_ids').multiselect({noneSelectedText: 'Please select a product.',classes: "productSelect",selectedList: 3,}); 
      
	$('#study_platform_ids').multiselect({noneSelectedText: 'Please select a platform.',classes: "platformSelect",selectedList: 4,});

	$('#study_activity_type_ids').multiselect({noneSelectedText: 'Please select an activity type.',classes: "activityTypeSelect",selectedList: 2,});

});