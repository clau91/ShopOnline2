<%@page import="it.accenture.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acquista</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>

<%Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<%Prodotto prodotto = (Prodotto) request.getAttribute("prodotto"); %>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>



<!-- navbar -->
<nav class="nav navbar">
<div class="navbar-header div-icona-home" style="margin-left: 25px;">

<a href="index.jsp">
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
<div align="right" style="margin-right: 30px;">
<form action="Ricerca" method="get">
<input type="text2" name="keyword" placeholder="Cerca...">

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
<h3>ACQUISTA</h3>
<p></p>
</div><!-- chiusura jumbotron -->

<form action="Acquista" method="post" class="form-horizontal">
<!-- spedizione -->
<div class="form-group" align="center">
<label class="control-label">Scegli il tipo di spedizione</label>
</div>
<div align="center">
<input type="radio" name="tipoSpedizione" value="PRIORITARIA" checked>
Prioritaria
<br>
<input type="radio" name="tipoSpedizione" value="RAPIDA">
Rapida
<br>
<input type="radio" name="tipoSpedizione" value="ORDINARIA">
Ordinaria
<br>
</div>
<span ></span>
<br>
<br>
<br>


<!-- bottoni -->
<div class="form-group" >
<span class="col-md-5"></span>
<div class="col-md-4">
<input  type="submit" class="btn btn-primary" value="Acquista" >
<input  type="submit" class="btn btn-warning" value="Indietro">
</div>
<span class="col-md-3"></span>
</div>
</form>



</body>
</html>