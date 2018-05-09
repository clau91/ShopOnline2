<%@page import="it.accenture.model.Prodotto"%>
<%@page import="it.accenture.model.Acquisto"%>
<%@page import="java.util.List"%>
<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<title>Lista Acquisti</title>
</head>
<body>
<% Utente utente = (Utente)session.getAttribute("utenteLoggato"); %>
<% List<Acquisto> listaAcquisti =(List<Acquisto>) request.getAttribute("listaAcquisti");%>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>
<% List<Prodotto> listaProdottiAcquistati = (List<Prodotto>) request.getAttribute("listaProdottiAcquistati"); %>

<!-- NAVBAR -->

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
<div align="right" style="margin-right: 30px;">
<form autocomplete="off" action="Ricerca" method="get">
<input id="myInput" type="text" name="keyword" placeholder="Cerca...">
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
<div class="container">
<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>LISTA ACQUISTI</h1>

</div><!-- chiusura jumbotron -->


<!-- Tabella -->
<div class="container">
<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th>Id Acquisto</th>
<th>Quantità Acquistata</th>
<th></th>
<th></th>
<th></th>

<th>Lascia una recensione</th>
<th></th>
</tr>
</thead>
<tbody>
<% for(Acquisto acquisto : listaAcquisti) {%>


<tr>

<td><%=acquisto.getIdAcquisto() %></td>
<td><%=acquisto.getQuantitaAcquistata() %></td>
<%for(Prodotto prodotto : listaProdottiAcquistati) {%>
<td><img src="<%=prodotto.getImmagine()%>" style="width: 60px; height: 60px;"></td>
<td><input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>"></td>
<td><%if(prodotto.getQuantitaDisponibile() > 0){%>
<form action="Carrello2"  method="get">
<select name="quantitaAcquistata" id="quantitaAcquistata">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select><br><br>
<input type="submit" class="btn btn-success" value="Aggiungi al carrello" id="Carrello"></td>
<td><textarea rows="1" cols="30" name="titolo" placeholder="inserisci titolo" id="titolo" ></textarea>
<br>
<textarea rows="5" cols="30" name="contenuto" placeholder="inserisci recensione" id="contenuto"></textarea>
<br>
<input type="submit" name="invia" value="Invia i dati"></td>
<%}else{%>
class="btn btn-warning"
disabled
<%} %>
<%if(utente == null) {%>
disabled
<% }%>





</form>

<% }%>
<% }%>

</tr>


</tbody>
</table>
</div>
</div>
</div>
</body>
</html>