<%@page import="it.accenture.controller.ListaAcquisti"%>
<%@page import="it.accenture.model.Acquisto"%>
<%@page import="it.accenture.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type=”text/javascript” src=”caption.js”></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>
<% List<Prodotto> listaTop3Venduti = (List<Prodotto>) session.getAttribute("listaTop3Venduti"); %>
<% List<Acquisto> listaOrdini =(List<Acquisto>) request.getAttribute("listaOrdini");%>
<% List<Acquisto> listaAcquisti =(List<Acquisto>) request.getAttribute("listaAcquisti");%>


<!-- navbar -->
<nav class="nav navbar">
<div class="navbar-header div-icona-home" style="margin-left: 25px;">

<a href="index.html">
<img src="img/logo.png" class="icona">
</a>

</div>
<div align="center">
<ul class="nav navbar-nav" >
<li><a href="ListaProdotti">Prodotti</a></li>
<li><a href="ListaProdottiInOfferta">Offerte</a></li>
<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="ListaProdottiPerCategoria">Categorie<span class="caret"></span></a>
<ul class="dropdown-menu">
  <li><a href="ListaProdottiPerCategoria?categoria=CALCIO">CALCIO</a></li>
  <li><a href="ListaProdottiPerCategoria?categoria=BASKET">BASKET</a></li>
  <li><a href="ListaProdottiPerCategoria?categoria=TENNIS">TENNIS</a></li>
  <li><a href="ListaProdottiPerCategoria?categoria=NUOTO">NUOTO</a></li>
  <li><a href="ListaProdottiPerCategoria?categoria=TREKKING">TREKKING</a></li>  
</ul>
</li>
<% if (utente == null) { %>
<li><a href="registrazione.jsp?form=registrazione">Registrazione</a></li>
<li><a href="registrazione.jsp?form=login">Login</a></li>
<% } else { %>
<li><a href="ListaAcquisti">Lista Acquisti</a></li>
<li><a href="ListaOrdini">Lista Ordini</a></li>
<li><a href="Logout">Logout</a></li>
<% } %>
</ul>
</div>


<!-- Bottone Ricerca -->
<div align="right" style="margin-right: 30px;">

<form autocomplete="off" action="Ricerca" method="get">
<input id="myInput" type="text" name="keyword" >
<input type="submit" value="cerca">
<script> autocomplete(document.getElementById("myInput"));</script>


<% if (utente == null) { %>
<a href="registrazione.jsp?form=login"><img src="img/user.png" class="icona" style="margin-left: 30px"></a>
<% } else { %>
<a href="profiloUtente.jsp"><img src="img/user.png" class="icona" style="margin-left: 30px"></a>
<a href="carrello.jsp"><img src="img/cart.png" class="icona" >
<% if (listaCarrello != null) { %>
<%= listaCarrello.size() %>
<%} else { %>
0
<% } %>
</a>
<% } %>
</form>
</div>

</nav><!-- chiusura navbar  -->



<!-- JUMBOTRON -->
<div class="jumbotron">
<h1><img src="img/logo.png" class="logo">SPORTADDICTED</h1>
<p></p>
</div><!-- chiusura jumbotron -->

<!-- DIV CONTAINER -->
<div class="container">


<!-- CAROUSEL -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">

<!-- Indicators -->
<ol class="carousel-indicators">
   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
   <li data-target="#myCarousel" data-slide-to="1"></li>
   <li data-target="#myCarousel" data-slide-to="2"></li>
   <li data-target="#myCarousel" data-slide-to="3"></li>
   <li data-target="#myCarousel" data-slide-to="4"></li>
   
 </ol>

 <!-- Wrapper for slides -->

<div class="carousel-inner">
  <div class="item active">
    <img src="img/basket.jpg" alt="basket" style="width:100%;">
  <div class="carousel-caption">
    <h3>BASKET</h3>
  </div>
</div>

<div class="item" >
  <img src="img/calcio.jpg" alt="calcio" style="width:100%;">
  <div class="carousel-caption">
    <h3>CALCIO</h3>
  </div>
</div>

<div class="item">
  <img src="img/tennis.jpg" alt="tennis" style="width:100%;">
  <div class="carousel-caption">
    <h3>TENNIS</h3>
  </div>
</div>

<div class="item">
  <img src="img/nuoto.jpg" alt="nuoto" style="width:100%;">
  <div class="carousel-caption">
    <h3>NUOTO</h3>
  </div>
</div>

<div class="item">
  <img src="img/trekking.jpg" alt="trekking" style="width:100%;">
    <div class="carousel-caption">
      <h3>TREKKING</h3>
    </div>
  </div>

</div>

<!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<br>
<br>

<% if (listaTop3Venduti.size() < 3) { %>

<% } else { %>
<!-- CAROUSEL PRODOTTI PIU VENDUTI -->
<div id="myCarousel2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="4000">
<div class="jumbotron">
<h5 style="font-size: 30px">PRODOTTI PIU VENDUTI</h4>
</div>
<!-- immagini -->
<div class="carousel-inner">

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>

<div class="item active">
<a class="a-popover" data-placement="right" data-toggle="popover" data-trigger="hover" title="Prezzo:<%=listaTop3Venduti.get(0).getPrezzo() %>&euro;"
 data-content="Sconto:<%=listaTop3Venduti.get(0).getSconto()%>&percnt; | Q. Disponibile:<%=listaTop3Venduti.get(0).getQuantitaDisponibile() %>">
 <img class="img-carousel" src="<%=listaTop3Venduti.get(0).getImmagine()%>"  style="width: 300px; height: 300px;"></a>
</div>

<div class="item">
<a class="a-popover" data-placement="right" data-toggle="popover" data-trigger="hover" title="Prezzo:<%=listaTop3Venduti.get(1).getPrezzo() %>&euro;"
 data-content="Sconto:<%=listaTop3Venduti.get(1).getSconto()%>&percnt; | Q. Disponibile:<%=listaTop3Venduti.get(1).getQuantitaDisponibile() %>">
 <img class="img-carousel" src="<%=listaTop3Venduti.get(1).getImmagine()%>"  style="width: 300px; height: 300px;"></a>
</div>

<div class="item">
<a class="a-popover" data-placement="right" data-toggle="popover" data-trigger="hover" title="Prezzo:<%=listaTop3Venduti.get(2).getPrezzo() %>&euro;"
 data-content="Sconto:<%=listaTop3Venduti.get(2).getSconto()%>&percnt; | Q. Disponibile:<%=listaTop3Venduti.get(2).getQuantitaDisponibile() %>">
 <img class="img-carousel" src="<%=listaTop3Venduti.get(2).getImmagine()%>"  style="width: 300px; height: 300px;"></a>
</div>

</div>


<!-- INDICATORI -->
<ol class="carousel-indicators">
<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel2" data-slide-to="1"></li>
</ol>
<!-- FRECCE -->
<a class="left carousel-control" href="#myCarousel2" data-slide="next">
<span class="glyphicon glyphicon-chevron-left"></span>
</a>
<a class="right carousel-control" href="#myCarousel2" data-slide="prev">
<span class="glyphicon glyphicon-chevron-right"></span>
</a>

</div><!-- CHIUSURA CAROUSEL PRODOTTI PIU VENDUTI -->
<% } %>


</div><!-- CHIUSURA CONTAINER -->


<br>  
<br>  
<br>  
<br>  

<!-- FOOTER -->
<div class="container-fluid text-center text-md-left">
<div class="footer">
<br>

<div class="col-md-3" align="center"> 
  <h5 style="font-size: 25px; width: 250px; margin-top: 0px">MODALITA DI PAGAMENTO</h5>
  <img src="img/mastercard.jpg" class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="MasterCard">
  <img src="img/paypal.jpg"     class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="PayPal">
  <img src="img/visa.jpg"       class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="Visa"> 
  <img src="img/postepay.jpg"   class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="PostePay"> 
  <img src="img/Americanexpress.png" class="icona" class="a-popover"  data-toggle="popover" data-trigger="hover" title="American Express"> 	
</div>

<div class="col-md-3" align="center">
<ul class="list-unstyled">
<li style="font-size: 25px; width: 250px"><a href="registrazione.jsp?form=login"><u>AREA RISERVATA</u></a></li>
</ul>
</div>
     
<div class="col-md-3" align="center">
<ul class="list-unstyled">
<li style="font-size: 25px; width: 250px"><a href="contatti.jsp"><u>CHI SIAMO</u></a></li>
</ul>
</div>          

<div class="col-md-3" align="center">
<h5 style="font-size: 25px; width: 250px; margin-top: 0px">SPEDITO DA</h5>
    <img src="img/posteitaliane.jpg"  class="icona" class="a-popover"  data-toggle="popover" data-trigger="hover" title="Poste Italiane">
    <img src="img/DHL.png"   class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="DHL">
 	<img src="img/TNT.jpg"  class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="TNT">
 	<img src="img/Sda.jpg"   class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="SDA">
 	<img src="img/gls.jpeg"  class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="GLS">
</div>   

<br> 
<br>
<br>

    


 <!--Copyright-->
<div class="footer-copyright py-3 text-center">
<h5 style="font-size: 20px"><img src="img/logo.png" class="icona" class="a-popover" data-toggle="popover" data-trigger="hover" title="WEforSPORTS">&copy;SPORTSADDICTED 2018 - Partita IVA: 012345612132 - Tutti i diritti riservati</h5>
</div>
<br>

</div>
</div>
   
<!-- FINE FOOTER-->

</body>
</html>