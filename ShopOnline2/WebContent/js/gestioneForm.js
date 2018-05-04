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

function magnify(imgID, zoom) {
	  var img, glass, w, h, bw;
	  img = document.getElementById(imgID);

	  /*create magnifier glass:*/
	  glass = document.createElement("DIV");
	  glass.setAttribute("class", "img-magnifier-glass");

	  /*insert magnifier glass:*/
	  img.parentElement.insertBefore(glass, img);

	  /*set background properties for the magnifier glass:*/
	  glass.style.backgroundImage = "url('" + img.src + "')";
	  glass.style.backgroundRepeat = "no-repeat";
	  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
	  bw = 3;
	  w = glass.offsetWidth / 2;
	  h = glass.offsetHeight / 2;

	  /*execute a function when someone moves the magnifier glass over the image:*/
	  glass.addEventListener("mousemove", moveMagnifier);
	  img.addEventListener("mousemove", moveMagnifier);

	  /*and also for touch screens:*/
	  glass.addEventListener("touchmove", moveMagnifier);
	  img.addEventListener("touchmove", moveMagnifier);
	  function moveMagnifier(e) {
	    var pos, x, y;
	    /*prevent any other actions that may occur when moving over the image*/
	    e.preventDefault();
	    /*get the cursor's x and y positions:*/
	    pos = getCursorPos(e);
	    x = pos.x;
	    y = pos.y;
	    /*prevent the magnifier glass from being positioned outside the image:*/
	    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
	    if (x < w / zoom) {x = w / zoom;}
	    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
	    if (y < h / zoom) {y = h / zoom;}
	    /*set the position of the magnifier glass:*/
	    glass.style.left = (x - w) + "px";
	    glass.style.top = (y - h) + "px";
	    /*display what the magnifier glass "sees":*/
	    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
	  }

	  function getCursorPos(e) {
	    var a, x = 0, y = 0;
	    e = e || window.event;
	    /*get the x and y positions of the image:*/
	    a = img.getBoundingClientRect();
	    /*calculate the cursor's x and y coordinates, relative to the image:*/
	    x = e.pageX - a.left;
	    y = e.pageY - a.top;
	    /*consider any page scrolling:*/
	    x = x - window.pageXOffset;
	    y = y - window.pageYOffset;
	    return {x : x, y : y};
	  }
	}
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


