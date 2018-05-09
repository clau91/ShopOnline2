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


<!-- navbar -->
<nav class="nav navbar">
<div class="navbar-header div-icona-home" style="margin-left: 25px;">

<a href="index.html">
<img src="img/home.png" class="icona">
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
<li><a href="contatti.jsp">Contatti</a></li>
<% } else { %>
<li><a href="ListaAcquisti">Lista Acquisti</a></li>
<li><a href="ListaOrdini">Lista Ordini</a></li>
<li><a href="Logout">Logout</a></li>
<li><a href="contatti.jsp">Contatti</a></li>
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
<h1>WELCOME TO SPORTADDICTED</h1>
<p></p>
</div><!-- chiusura jumbotron -->

<!-- DIV CONTAINER -->
<div class="container">

<!-- CAROUSEL -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
<!-- immagini -->
<div class="carousel-inner">
<div class="item active">
<img class="img-carousel" src="img/basket.jpg">
</div>
<div class="item">
<img class="img-carousel" src="img/calcio.jpg">
</div>
<div class="item">
<img class="img-carousel" src="img/tennis.jpg">
</div>
<div class="item">
<img class="img-carousel" src="img/nuoto.jpg">
</div>
<div class="item">
<img class="img-carousel" src="img/trekking.jpg">
</div>
</div>
<!-- INDICATORI -->
<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel" data-slide-to="1"></li>
<li data-target="#myCarousel" data-slide-to="2"></li>
<li data-target="#myCarousel" data-slide-to="3"></li>
<li data-target="#myCarousel" data-slide-to="4"></li>

</ol>
<!-- FRECCE -->
<a class="left carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-left"></span>
</a>
<a class="right carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-right"></span>
</a>

</div><!-- CHIUSURA CAROUSEL -->



<!-- JUMBOTRON -->
<br>
<br>
<div>
<div class="jumbotron">
<h4>PRODOTTI PIU VENDUTI</h4>
</div><!-- chiusura jumbotron -->

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>

<!-- CAROUSEL PRODOTTI PIU VENDUTI -->
<div id="myCarousel2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="4000">
<!-- immagini -->
<div class="carousel-inner">
<div class="item active">

<a class="a-popover" data-placement="right" data-toggle="popover" data-trigger="hover" title="Prezzo:<%=listaTop3Venduti.get(0).getPrezzo() %>&euro;"
 data-content="Sconto:<%=listaTop3Venduti.get(0).getSconto()%>&percnt;">
 <img class="img-carousel" src="<%=listaTop3Venduti.get(0).getImmagine()%>"  style="width:100%"></a>
</div>

<div class="item">
<a class="a-popover" data-placement="right" data-toggle="popover" data-trigger="hover" title="Prezzo:<%=listaTop3Venduti.get(1).getPrezzo() %>&euro;"
 data-content="Sconto:<%=listaTop3Venduti.get(1).getSconto()%>&percnt;">
 <img class="img-carousel" src="<%=listaTop3Venduti.get(1).getImmagine()%>"  style="width: 300px; height: 300px;"></a>
</div>

<div class="item">
<a class="a-popover" data-placement="right" data-toggle="popover" data-trigger="hover" title="Prezzo:<%=listaTop3Venduti.get(2).getPrezzo() %>&euro;"
 data-content="Sconto:<%=listaTop3Venduti.get(2).getSconto()%>&percnt;">
 <img class="img-carousel" src="<%=listaTop3Venduti.get(2).getImmagine()%>"  style="width: 300px; height: 300px;"></a>
</div>
</div>



 
 

<!-- INDICATORI -->
<ol class="carousel-indicators">
<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel2" data-slide-to="1"></li>
<li data-target="#myCarousel2" data-slide-to="2"></li>
</ol>
<!-- FRECCE -->
<a class="left carousel-control" href="#myCarousel2" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
</a>
<a class="right carousel-control" href="#myCarousel2" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
</a>

</div><!-- CHIUSURA CAROUSEL PRODOTTI PIU VENDUTI -->

</div>
</div><!-- CHIUSURA CONTAINER -->

<!--PAGE Footer-->
     <br>  
    <!--Footer Links-->
    <div class="container-fluid text-center text-md-left">
    <div class="row">

    <!--First column-->
    <div class="col-md-4">
       <h5 >Info Contacts</h5>
       <h5>Via G. Washington 50, 20146 Milano(MI) </h5>
       <h5>Tel: 800123123 </h5>
       <h5>Email: info@sportaddicted.com </h5>
    </div>
            
   

    <!--Second column-->
       <div class="col-md-2 mx-auto">
         <ul class="list-unstyled">
          <li><a class="grey-text text-lighten-3" href="index.jsp">Home</a></li>   
         </ul>
       </div>
   
   <!--Third column-->
       <div class="col-md-2 mx-auto">
         <ul class="list-unstyled">
          <li><a class="grey-text text-lighten-3"  href="registrazione.jsp?form=login">Area Riservata</a></li> 
         </ul>
       </div>
            
   <!--Third column-->
       <div class="col-md-2 mx-auto">
         <ul class="list-unstyled">
          <li><a class="grey-text text-lighten-3"  href="contatti.jsp">About Us</a></li>
         </ul>
       </div>        
            
    
    <!--First column-->
     <div class="col-md-2 mx-auto" text-align="left">
       <h5 >Shopping Online Facile</h5>
       <h5>Spedizione Garantita </h5>
       <h5>Reso gratuito</h5>
       <h5>90 giorni per il reso</h5>
    </div>
    
    
    
      </div>
     </div>
   </div>
    <!--/.Footer Links-->
<br>
<br>
    <!--Copyright-->
    <div class="footer-copyright py-3 text-center">
        <h5>&reg;SPORTSADDICTED 2018 - Partita IVA: 012345612132 - Tutti i diritti riservati</h5>
    </div>


</body>
</html>