var ready = function(){

	if($("body.splash").length > 0){
		var aspectRatio = 216/384;

		var $win = $(window);

		var height = $win.height();
		var width = $win.width();

		var $video = $("video.splashvid");

		var setVideoSize = function(){

			var vidWidth = height/aspectRatio;

			var scale = width/vidWidth;

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

}


$(document).ready(ready);
$(document).on("page:load", ready);


