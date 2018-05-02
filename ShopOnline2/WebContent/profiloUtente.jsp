<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profilo Utente</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>

<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% String scelta = (String) request.getParameter("form"); %>



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
<input type="text2" name="search" placeholder="Cerca...">



<% if (utente == null) { %>
<a href="registrazione.jsp?form=login"><img src="img/user.png" class="icona" style="margin-left: 30px"></a>
<% } else { %>
<a href="profiloUtente.jsp"><img src="img/user.png" class="icona" style="margin-left: 30px"></a>
<a href="Carrello"><img src="img/cart.png" class="icona" ></a>
<% } %>
</div>


</nav><!-- chiusura navbar  -->


<<<<<<< HEAD

<div class="jumbotron" >
<h1>User Account</h1>
=======
<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>IL MIO ACCOUNT </h1>
>>>>>>> branch 'master' of https://github.com/clau91/ShopOnline2
</div><!-- CHIUSURA JUMBOTRON -->

<div class="container"  style="margin-left:80px">

<h3>Nome: <%=utente.getNome() %></h3>
<h3>Cognome: <%=utente.getCognome() %></h3>
<h3>Username: <%=utente.getUsername() %></h3>
<h3>Password: <%=utente.getPassword() %></h3>
<h3>Indirizzo: <%=utente.getIndirizzo() %></h3>
<h3>Prodotti Acquisti: <%=utente.getListaAcquisti() %></h3>
<h3>Prodotti Ordinati: <%=utente.getListaOrdini() %></h3>
<br>

<p><a href="updateAccount.jsp">Click here </a> to modify User Account</p>


<<<<<<< HEAD
=======
<div class="container">
<div class="table-responsive">
<table class="table">
<!-- table head -->
<thead>
<tr>
<th>Nome</th>
<th>Cognome</th>
<th>Username</th>
<th>Password</th>
<th>Indirizzo </th>
<th>Lista Ordini</th>
<th>Lista Acquisto</th>
</tr>
</thead>
<!-- table body -->
<tbody>
<tr>
<td><%=utente.getNome()%></td>
<td><%=utente.getCognome()%></td>
<td><%=utente.getUsername()%></td>
<td><%=utente.getPassword()%></td>
<td><%=utente.getIndirizzo()%></td>
<td><%=utente.getListaOrdini()%></td>
<td><%=utente.getListaAcquisti()%></td>
</tr>
</tbody>
</table>
<div class="col-md-5 text-primary">
<p>Clicca <a onclick="update()">qui</a> per modificare i tuoi dati</p>
</div>
</span class="col-md-3"></span>
</div>
>>>>>>> branch 'master' of https://github.com/clau91/ShopOnline2
</div>
</div>

</body>
</html>