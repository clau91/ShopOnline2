<%@page import="it.accenture.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LISTA PRODOTTI IN OFFERTA</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>

<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaProdottiInOfferta = (List<Prodotto>) request.getAttribute("listaProdottiInOfferta"); %>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>


<!-- NAVBAR -->
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
<h1>PRODOTTI IN OFFERTA</h1>
<p></p>
</div><!-- chiusura jumbotron -->

<!-- Tabella -->
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
<th>Sconto(%)</th>
<th>Acquista</th>
<th>Q.tà richiesta</th>
<th></th>
<th>Dettagli</th>
<th></th>
</tr>
</thead>

<!-- table body -->
<tbody>
<%for(Prodotto prodotto : listaProdottiInOfferta){%>
<tr>
<td><%=prodotto.getNome() %></td>
<td><%=prodotto.getMarca() %></td>
<td><%=prodotto.getPrezzo() %>&euro;</td>
<td><%=prodotto.getQuantitaDisponibile()%></td>
<td><%=prodotto.getSconto() %></td>
<td><img src="<%=prodotto.getImmagine()%>" style="width: 60px; height: 60px;"></td>



<td align="center">
<%if(prodotto.getQuantitaDisponibile() > 0){%>
<form action="Carrello3" method="get">
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
<form action="Dettagli" method="post">
<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<input type="submit" value="Dettagli" class="btn btn-secondary">
</form>
</td>
</tr>
</tr>
<%} %>
</tbody>

</table>

</div>
</div><!-- chiusura container -->

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