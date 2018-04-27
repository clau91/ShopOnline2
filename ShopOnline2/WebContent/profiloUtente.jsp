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


<% if(scelta.equals("registrazione")) { %>
<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>Registrati per acquistare un prodotto !</h1>
</div><!-- chiusura jombotron -->
<% } else if(scelta.equals("login")) { %>
<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>Profilo Utente !</h1>
</div><!-- CHIUSURA JUMBOTRON -->
<% } %>
<!-- CONTAINER -->
<div class="container">


<% if(scelta.equals("login")) { %>


<!-- FORM LOGIN -->
<form action="Login" method="post" class="form-horizontal"
novalidate id="formLogin">

<!-- USERNAME -->
<div class="form-group">
<label class="col-md-4 control-label">Inserisci Username</label>
<div class="col-md-5">
<input type ="text" name="username" placeholder="inserisci username" class="form-control" id="username">
</div>
<span class="col-md-3"></span>
</div>

<!-- PASSWORD -->
<div class="form-group">
<label class="col-md-4 control-label">Inserisci Password</label>
<div class="col-md-5">
<input type ="password" name="password" placeholder="inserisci password" class="form-control" id="myInput"><br>
<input type="checkbox" onclick="myFunction()">Show Password

</div>
<span class="col-md-3"></span>
</div>

<!-- BOTTONI -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type ="submit" value="Login" class="btn-primary">
<input type ="reset" value="Reset" class="btn-warning">
</div>
<span class="col-md-3"></span>
</div>
</form><!-- chiusura form login -->



<!-- LINK NON  REGISTRATO -->
<div id="linkLogin">
<span class="col-md-4"></span>
<div class="col-md-5 text-primary">
<p>Non sei registrato ?</p>
<p><a onclick="cambioForm()">Clicca qui</a> per registrarti</p>
</div>
<span class="col-md-3"></span>
</div>
<% } %>

<% if(request.getAttribute("errore") != null) { %>
<div class="alert alert-danger text-center">
<h3>Username o Password Sbagliati</h3>
</div>
<% } %>
</div><!-- chiusura container -->


<div class="container">
<div class="table-responsive">
<table class="table">
<!-- table head -->
<thead>
<tr>
<th>Nome</th>
<th>Cognome</th>
<th>Indirizzo </th>
<th>Prodotti Acquisti</th>
</tr>
</thead>
<!-- table body -->
<tbody>

</tr>
</tbody>
</table>
</div>
</div>

</body>
</html>