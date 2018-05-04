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
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<title>Lista Acquisti</title>
</head>
<body>
<% Utente utente =(Utente)session.getAttribute("utenteLoggato"); %>
<% List<Acquisto> listaAcquisti =(List<Acquisto>) request.getAttribute("listaAcquisti");%>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>

<!-- NAVBAR -->

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

<div align="right" style="margin-right: 40px;">
<form action="Ricerca" method="get">
<input type="text2" name="keyword" placeholder="Cerca...">
</form>



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
</div>


</nav><!-- chiusura navbar  -->

<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>LISTA ACQUISTI</h1>
<p></p>
</div><!-- chiusura jumbotron -->

<!-- DIV CONTAINER -->
<div class="container">

<!-- Tabella -->
<div class="table responsive">
<table class="table">
<thead>
<tr>
<th>Id Acquisto</th>
<th>Tipo Spedizione</th>
<th>Data Partenza</th>
<th>Data Arrivo</th>
<th>Prezzo Spedizione</th>
<th>Quantità Acquistata</th>
</tr>
</thead>
<tbody>
<% for(Acquisto acquisto : listaAcquisti) {%>
<tr>
<td><%=acquisto.getIdAcquisto() %></td>
<td><%=acquisto.getTipoSpedizione()%></td>
<td><%=acquisto.getDataInizio() %></td>
<td><%=acquisto.getDataFine() %></td>
<td><%=acquisto.getPrezzoDiSpedizione() %></td>
<td><%=acquisto.getQuantitaAcquistata() %></td>

</tr>
<%} %>

</tbody>
</table>
</div>
</body>
</html>