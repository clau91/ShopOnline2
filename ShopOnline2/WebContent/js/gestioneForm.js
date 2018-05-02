function cambioForm(){
	console.log(window.location.href);
	var indirizzo = window.location.href;
	var split = window.location.href.split('=');
	if(indirizzo.includes("form=registrazione")) {
		//console.log('siamo su registrazione');
		var nuovoIndirizzo = split[0] + "=login";
		//console.log(nuovoIndirizzo);
		window.location.href = nuovoIndirizzo;
	} else if (indirizzo.includes("form=login")) {
		//console.log('siamo su login');
		var nuovoIndirizzo = split[0] + "=registrazione";
		//console.log(nuovoIndirizzo);
		window.location.href = nuovoIndirizzo;
	}
}

function myFunction() {
    var x = document.getElementById("myInput");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}


function myMap() {
	 var myLatLng = new google.maps.LatLng(45.4626353, 9.1552408);
    var mapOptions = {
        center: myLatLng,
        zoom: 17,
        mapTypeId: google.maps.MapTypeId.HYBRID
    }
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    var marker = new google.maps.Marker({
        position: myLatLng, 
        map: map,
        title:"SportAddicted s.r.l."
    });
    var contentString = '<em>SportAddicted s.r.l.</em><br><em>Via G. Washington 50</em><br><em>20146, Milano(MI)</em>';
    var infoWindow = new google.maps.InfoWindow({
        content: contentString
    });
    google.maps.event.addListener(marker, 'click', function() {
        infoWindow.open(map,marker);
    });
}



