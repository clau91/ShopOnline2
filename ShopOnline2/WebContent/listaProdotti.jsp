<%@page import="it.accenture.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Prodotti</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaProdotti = (List<Prodotto>) request.getAttribute("listaProdotti"); %>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>


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
</form>
<input type="submit" value="clicca">
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

</div>


</nav><!-- chiusura navbar  -->

<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>LISTA PRODOTTI</h1>
<p></p>
</div><!-- chiusura jumbotron -->


<div class="container">
<div class="table-responsive">
<table class="table">

<!-- table head -->
<thead>
<tr>
<th>Nome</th>
<th>Marca</th>
<th>Prezzo </th>
<th>Q.tà Disponibile</th>
<th></th>
<th>Q.tà richiesta</th>
<th></th>
<th></th>
</tr>
</thead>
<!-- table body -->
<tbody >
<%for(Prodotto prodotto : listaProdotti){%>
<tr align="center">

<td><%=prodotto.getNome() %></td>
<td><%=prodotto.getMarca() %></td>
<td><%=prodotto.getPrezzo() %> &euro;</td>
<td><%=prodotto.getQuantitaDisponibile()%></td>
<td><img src="<%=prodotto.getImmagine()%>" style="width: 60px; height: 60px;"></td>

<!-- Tendina Quantita -->
<td align="center">
<%if(prodotto.getQuantitaDisponibile() > 0){%>
<form action="Carrello" method="get">
<select name="quantitaAcquistata" id="quantitaAcquistata">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
<% } %>



<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<input type="submit" value="Aggiungi al carrello" id="Carrello"
<%if(prodotto.getQuantitaDisponibile() > 0){%>
class="btn btn-success"
<%}else{%>
class="btn btn-warning"
disabled
<%} %>
<%if(utente == null) {%>
disabled
<% }%>
>
</form>
</td>

<!-- Button Dettagli -->
<td>
<form action="Dettagli" method="get">
<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<input type="submit" value="Dettagli" class="btn btn-secondary">

</form>
</td>

</tr>
<% }%>

</tbody>

</table>



</div>

</div><!-- chiusura container -->
</body>
</html>