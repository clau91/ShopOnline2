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
<title>Carrello</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>

<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>
<% List<Acquisto> listaQuantita = (List<Acquisto>) session.getAttribute("listaQuantita"); %>
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
<h1>CARRELLO</h1>
<p></p>
</div><!-- chiusura jumbotron -->

<br>
<br>
<br>


<!-- TABELLA -->
<% if (listaCarrello != null) { %>
<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Nome</th>
<th>Marca</th>
<th>Prezzo </th>
<th>Quantità</th>
<th></th>
<th></th>
</tr>
</thead>

<tbody>
<% for(Prodotto prodotto : listaCarrello) { %>
<tr>
<td><%=prodotto.getNome() %></td>
<td><%=prodotto.getMarca() %></td>
<td><%=prodotto.getPrezzo() %>&euro;</td>
<td><%=listaQuantita.get(listaCarrello.indexOf(prodotto))%></td>
<td></td>

<td><img src="<%=prodotto.getImmagine()%>" style="width: 60px; height: 60px;"></td>
<td><form action="RimuoviDaCarrello" method="get">
<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<input type="submit" value="Rimuovi" class="btn btn-secondary">
</form></td>
</tr>
<% } %>
</tbody>
</table>
</div>

<div align="center">
<form action="acquista.jsp" >
<input type="hidden">
<input type="submit" value="Procedi all'acquisto" class="btn btn-secondary">
</form>
</div>

<%} else { %>
<br> 
<br>
<br> 
<br>
<br> 
<br>
<br>
<br>
<h3 align="center">Nessun prodotto nel carrello</h3>
<br> 
<br>
<br> 
<br>
<br>

<br> 
<br>
<br>
<% } %>

<br>
<br>
<br>
<br>
<br>


<!-- FOOTER -->
<div class="container-fluid text-center text-md-left">
<div class="footer">
<br>

<div class="col-md-4">   
</div>

<div class="col-md-2">
<ul class="list-unstyled">
<li style="font-size: 20px; width: 250px"><a href="registrazione.jsp?form=login"><u>AREA RISERVATA</u></a></li> 
</ul>
</div>
     
<div class="col-md-2">
<ul class="list-unstyled">
<li style="font-size: 20px; width: 250px"><a href="contatti.jsp"><u>CHI SIAMO</u></a></li>
</ul>
</div>          

<div class="col-md-2 mx-auto">
</div>   

<br> 
<br>
<br>
     
<div style="font-size: 20px">
Spedizione Garantita<br> 
Reso gratuito<br>
90 giorni per il reso
</div>
<br>

<div style="font-size: 12px">
SportAddicted s.r.l. &nbsp;
Via G. Washington 50, 20146 Milano(MI) &nbsp; 
Tel: 800123123 &nbsp;
Email: info@sportaddicted.com 
</div>
<br>
</div>
</div>
   
<!-- FINE FOOTER-->




</body>
</html>