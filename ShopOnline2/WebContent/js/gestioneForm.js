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
    var x = document.getElementById("myInput2");
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

//autocomplete form
var prodotti = ["bastoni","borraccia", "borsa","boxer", "canotta", "completo", "cuffia","maglietta", "occhialini", "pallone", 
	"pantaloncini", "parastinchi", "polo", "racchetta", "scarpe", "tappanaso", "t-shirt", "zaino"];
function autocomplete(inp) {
	  var currentFocus;
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      a = document.createElement("DIV");
	      a.setAttribute("id", this.id + "autocomplete-list");
	      a.setAttribute("class", "autocomplete-items");
	      this.parentNode.appendChild(a);
	      for (i = 0; i < prodotti.length; i++) {
	        if (prodotti[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	          b = document.createElement("DIV");
	          //b.setAttribute("id", "ricerca"+i+);
	          b.innerHTML = "<strong>" + prodotti[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += prodotti[i].substr(val.length);
	          b.innerHTML += "<input type='hidden' value='" + prodotti[i] + "' id='ricerca"+i+"'>";
	          b.setAttribute("onclick", "window.location.href='/ShopOnline2/Ricerca?keyword=" + prodotti[i] + "'");
	              b.addEventListener("click", function(e) {
	              inp.value = this.getElementsByTagName("input")[0].value;
	              closeAllLists();
	          });
	          a.appendChild(b);
	        }
	      }
	  });
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list");
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        currentFocus++;
	        addActive(x);
	      } else if (e.keyCode == 38) { //up
	        currentFocus--;
	        addActive(x);
	      } else if (e.keyCode == 13) {
	        e.preventDefault();
	        if (currentFocus > -1) {
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
	  function addActive(x) {
	    if (!x) return false;
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  function removeActive(x) {
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  function closeAllLists(elmnt) {
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	      x[i].parentNode.removeChild(x[i]);
	    }
	  }
	}
	document.addEventListener("click", function (e) {
	    closeAllLists(e.target);
	});
	}

function validazioneForm() {
	var nome = document.getElementById('nome').value;
	var cognome = document.getElementById('cognome').value;
	var indirizzo = document.getElementById('indirizzo').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var controllo = true;
	if(nome==""){
		document.getElementById('nome').placeholder = 'Campo Obbligatorio';
		document.getElementById('nome').classList.add('alert-danger');
		controllo = false;
	} else {
		document.getElementById('nome').classList.add('alert-success');
	}
	if(cognome==""){
		document.getElementById('cognome').placeholder = 'Campo Obbligatorio';
		document.getElementById('cognome').classList.add('alert-danger');
		controllo = false;
	} else {
		document.getElementById('cognome').classList.add('alert-success');
	}
	if(indirizzo==""){
		document.getElementById('indirizzo').placeholder = 'Campo Obbligatorio';
		document.getElementById('indirizzo').classList.add('alert-danger');
		controllo = false;
	} else {
		document.getElementById('indirizzo').classList.add('alert-success');
	}
	if(username==""){
		document.getElementById('username').placeholder = 'Campo Obbligatorio';
		document.getElementById('username').classList.add('alert-danger');
		controllo = false;
	} else {
		document.getElementById('username').classList.add('alert-success');
	}
	if(password==""){
		document.getElementById('password').placeholder = 'Campo Obbligatorio';
		document.getElementById('password').classList.add('alert-danger');
		controllo = false;
	} else {
		document.getElementById('password').classList.add('alert-success');
	}
	if(controllo==false){
		document.getElementById('alert').style.display = 'block';
	}
		return controllo;
	}	
		
	function validazioneFormLogin() {
		
		var username = document.getElementById('username').value;
		var password = document.getElementById('password').value;
		var controllo = true;

		if(username=="" & password==""){
			document.getElementById('username').placeholder = 'Campo Obbligatorio';
			document.getElementById('username').classList.add('alert-danger');
			document.getElementById('password').placeholder = 'Campo Obbligatorio';
			document.getElementById('password').classList.add('alert-danger');
			controllo = false;
		} else if (username=="" & password!=""){
			document.getElementById('username').placeholder = 'Campo Obbligatorio';
			document.getElementById('username').classList.add('alert-danger');
			document.getElementById('password').classList.remove('alert-danger');			
			document.getElementById('password').classList.add('alert-success');
			controllo = false;			
		} else if (username!="" & password==""){
			document.getElementById('username').classList.remove('alert-danger');
			document.getElementById('username').classList.add('alert-success');
			document.getElementById('password').placeholder = 'Campo Obbligatorio';
			document.getElementById('password').classList.add('alert-danger');
			controllo = false;	
		} if (controllo == false){
			document.getElementById('alert').style.display = 'block';
		}
		return controllo;
}
