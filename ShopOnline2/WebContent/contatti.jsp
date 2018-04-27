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

<nav class="nav navbar">
<div class="navbar-header div-icona-home" style="margin-top: 15px; margin-left: 25px;">

<a href="index.jsp">
<img src="img/home.png" class="icona-home">
</a>
</a>
</div>
<div align="center">
<ul class="nav navbar-nav" >
<li><a href="ListaProdotti">Prodotti</a></li>
<li><a href="ListaProdottiInOfferta">Offerte</a></li>
<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="ListaProdottiPerCategoria">Categorie<span class="caret"></span></a>
<ul class="dropdown-menu">
  <li><a href="#">CALCIO</a></li>
  <li><a href="#">BASKET</a></li>
  <li><a href="#">TENNIS</a></li>
  <li><a href="#">NUOTO</a></li>
  <li><a href="#">TREKKING</a></li>  
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
<% } %>
</ul>
</div>

<div align="right" style="margin-right: 30px;">
<input type="text" placeholder="Cerca..." style="margin-top: 25px; margin-right: 20px;">
<a href="ProfiloUtente"><img src="img/user.png" class="icona-user" style="margin-top: 15px;  margin-right: 15px;"></a>
<a href="Carrello"><img src="img/cart.png" class="icona-cart" style="margin-top: 15px;  margin-right: 15px;"></a>
</div>


</nav><!-- chiusura navbar  -->


<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>CONTATTI</h1>
<p></p>
</div><!-- chiusura jumbotron -->
</body>
</html>

<div align="center">
<p style="font-size: 25px;">
Sportaddicted s.r.l.
<br>
Via G. Washington 50, 20146 Milano(MI)
<br>
Tel: 800123123
<br>
Email: info@sportaddicted.com
<br>
<div id="map" style="width:400px;height:400px;background:yellow"></div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDD6eXrAKjxJBoACBt2Rhb6fbhqCTrmz1c&callback=myMap"></script></p>
</div>