var mapOptions, map, GeoMarker, printers, circle;

function createPrinter(id, p){
    var image = 'http://maps.google.com/mapfiles/ms/icons/red-dot.png';
    return {marker: new google.maps.Marker({
                        position: p,
                        map: map,
                        icon: image}),
        id:id,
        selected:false};
}

function setPrinterSelected(p, b){
    p.selected = b;
    if(p.selected){
        p.marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');
    } else {
        p.marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
    }
    updateSelectionInForm();
}

function updateSelectionInForm(){
    var values = [];
    printers.forEach(function(printer){
        if(printer.selected){
            values.push(printer.id);
        }
    });
    $('#job_printer').val(JSON.stringify(values));
}

function initializeMaps() {
  mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(57.70567520430679, 11.963586330413818)
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
var circleOptions = {
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,
      center: mapOptions.center,
      radius: 500,
      editable:true
    };
circle = new google.maps.Circle(circleOptions);

//on circle change mark printers in range.
var circleChanged = function() {
  printers.forEach(function(printer){
     //if (google.maps.geometry.poly.containsLocation(printer.marker.getPosition(), circle)) {
     if (circle.getBounds().contains(printer.marker.getPosition())) {
           setPrinterSelected(printer, true);
        } else {
           setPrinterSelected(printer, false);
        }
  });
};
  printers = [];
  $.getJSON('/printers.json', function(data){
    data.forEach(function(printer){
        var latLng = $.parseJSON(printer.location);
        printers.push(createPrinter(printer.id, new google.maps.LatLng(latLng.lat, latLng.lng)));
    });
      printers.forEach(function(printer){
        google.maps.event.addListener(printer.marker, 'click', function() {
           setPrinterSelected(printer, !printer.selected);
        });
      });
      circleChanged();
  });
google.maps.event.addListener(circle, 'radius_changed', circleChanged);
google.maps.event.addListener(circle, 'center_changed', circleChanged);

}

options = {

    // Required. Called when a user selects an item in the Chooser.
    success: function(files) {
    	$("#job_document").val(files[0].link);
    },

    // Optional. Called when the user closes the dialog without selecting a file
    // and does not include any parameters.
    cancel: function() {

    },

    // Optional. "preview" (default) is a preview link to the document for sharing,
    // "direct" is an expiring link to download the contents of the file. For more
    // information about link types, see Link types below.
    linkType: "preview", // or "direct"

    // Optional. A value of false (default) limits selection to a single file, while
    // true enables multiple file selection.
    multiselect: false, // or true

    // Optional. This is a list of file extensions. If specified, the user will
    // only be able to select files with these extensions. You may also specify
    // file types, such as "video" or "images" in the list. For more information,
    // see File types below. By default, all extensions are allowed.
    extensions: ['.pdf'],
};

$(document).ready(function(){
  var button = Dropbox.createChooseButton(options);
  var $uploadFile = $("upload_file");
  if($uploadFile.length > 0){
    $uploadFile[0].appendChild(button);
  }
  initializeMaps();
});
