var ready = function(){


		var $win = $(window);
		var height = $win.height();
		var width = $win.width();
		var $video = $("video.splashvid");
		var setVideoSize = function(){
			var vidWidth = height/(216/384);
			var vidHeight = width/(384/216);
			var ratio1 = width/height;
			var ratio2 = vidWidth/vidHeight;
			var scale = 1

			if(ratio1>ratio2){
				scale = width/vidWidth;
			}else{
				scale = height / vidHeight;
			}
			$video.css("-webkit-transform", "scaleX("+scale+") scaleY("+scale+")");
			$video.css("-moz-transform", "scaleX("+scale+") scaleY("+scale+")");
		}
		$win.resize(function(evt) {
			  height = $win.height();
			  width = $win.width();
			  setVideoSize();
		});
		setVideoSize();
	
}

$('#myModal').on('shown.bs.modal', function (e) {
  //maps.setCenter(new google.maps.LatLng(57.70567520430679, 11.963586330413818));
});

$(document).ready(ready);
$(document).on("page:load", ready);


