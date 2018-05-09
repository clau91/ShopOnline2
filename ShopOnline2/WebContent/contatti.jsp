<%@page import="it.accenture.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONTATTI</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>

<nav class="nav navbar">
<div class="navbar-header div-icona-home" style="margin-left: 25px;">

<a href="index.html">
<img src="img/home.png" class="icona">
</a>
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
<div align="right" >
<form autocomplete="off" action="Ricerca"class="navbar-form navbar-right"  role="search">
<input class="form-control mr-sm-2" id="myInput" type="search" name="keyword" placeholder="Search for...">
<button class="btn btn-outline-success my-2 my-sm-0" input type="submit" >Search</button>
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
<h1>CONTATTI</h1>
<p></p>
</div><!-- chiusura jumbotron -->


</body>


<div style="text-align:justify; margin-top: 100px; margin-left: 140px; margin-right: 140px;">
<p style="font-size: 20px;">
Sportsaddicted nasce dall esperienza di quattro persone, Claudio, Daniele, Pavlin e Angelo, che da molto tempo condividono lavoro e passione per l'outdoor e per lo sport.
Sportaddicted propone ai propri clienti tutto quello che può essere utile o indispensabile per vivere il mondo outdoor in maniera piacevole, confortevole e rilassante senza tralasciare
chi lo pratica come challenger. Molti hanno la passione dello sport pur non gareggiando da professionisti e per loro Sportaddicted ha selezionato oggetti, accessori, modelli con questo tema e, 
siccome anche in città possiamo vivere in uno stile sportivo, Sportaddicted propone un abbigliamento 
sportivo in grado di incontrare i gusti di tutti e soddisfare ogni esigenza con la cortesia e competenza di sempre.
<br>
<br>
<br>
</p>
</div>
<div  align="center" style="font-size: 20px;" >
Sportsaddicted s.r.l.
<br>
Via G. Washington 50, 20146 Milano(MI)
<br>
Tel: 800123123
<br>
Email: info@sportaddicted.com
<br>
<br>
ORARI DI APERTURA: 
<br>
Lun : 15,00-19,30
<br>
Mar - Ven : 9,30-19,30
<br>
Sab : 9,30-19,00
<br>
<br>
Partita IVA: 012345612132
<br>
Iscritta al CCIAA MILANO
<br>
Nr. di Iscrizione: 12345678
<br>
<br>
<br>

<div id="map" style="width:750px;height:500px;background:yellow"></div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDD6eXrAKjxJBoACBt2Rhb6fbhqCTrmz1c&callback=myMap"></script></p>
</div>


</html>