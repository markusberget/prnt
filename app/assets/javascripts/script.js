$(document).ready(function(){
	$("#btn-print").click(function(){
		$('#printModal').modal();
		setTimeout(function(){
			initializeMaps();
		}, 400);
	})
});


