
<%@page import="it.accenture.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>


<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% String scelta = (String) request.getParameter("form"); %>
<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>



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


<% if(scelta.equals("registrazione")) { %>
<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>Registrati per acquistare un prodotto !</h1>
</div><!-- chiusura jombotron -->
<% } else if(scelta.equals("login")) { %>
<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>Effettua la login per procedere all'ordine</h1>
</div><!-- CHIUSURA JUMBOTRON -->
<% } %>
<!-- CONTAINER -->
<div class="container">

<% if(scelta.equals("registrazione")) { %>
<!-- FORM REGISTRAZIONE -->
<form action="Registrazione" method="post" class="form-horizontal"
novalidate id="formRegistrazione">

<!-- NOME -->
<div class="form-group">
<label class="col-md-4 control-label">Nome</label>
<div class="col-md-5">
<input name="nome" placeholder="inserisci nome" class="form-control" id="nome">
</div>
<span class="col-md-3"></span>
</div>

<!-- COGNOME -->
<div class="form-group">
<label class="col-md-4 control-label">Cognome</label>
<div class="col-md-5">
<input name="cognome" placeholder="inserisci cognome" class="form-control" id="cognome">
</div>
<span class="col-md-3"></span>
</div>

<!-- INDIRIZZO -->
<div class="form-group">
<label class="col-md-4 control-label">Indirizzo</label>
<div class="col-md-5">
<input name="indirizzo" placeholder="inserisci indirizzo" class="form-control" id="indirizzo">
</div>
<span class="col-md-3"></span>
</div>

<!-- USERNAME -->
<div class="form-group">
<label class="col-md-4 control-label">Username</label>
<div class="col-md-5">
<input name="username" placeholder="inserisci username" class="form-control" id="username">
</div>
<span class="col-md-3"></span>
</div>

<!-- PASSWORD -->
<div class="form-group">
<label class="col-md-4 control-label">Password</label>
<div class="col-md-5">
<input type ="password" name="password" placeholder="inserisci password" class="form-control" id="password">
</div>
<span class="col-md-3"></span>
</div>


<!-- BOTTONI -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type ="submit" value="Registrati" class="btn-basic">
<input type ="reset" value="Reset" class="btn-basic">
</div>
<span class="col-md-3"></span>
</div>
</form><!-- CHIUSURA FORM REGISTRAZIONE -->

<!-- LINK GIA REGISTRATO -->
<div id="linkRegistrazione">
<span class="col-md-4"></span>
<div class="col-md-5 text-primary">
<p>Sei gi� registrato ?</p>
<p><a onclick="cambioForm()">Clicca qui</a> per la login</p>
</div>
<span class="col-md-3"></span>
</div>
<% } else if(scelta.equals("login")) { %>


<!-- FORM LOGIN -->
<form action="Login" method="post" class="form-horizontal"
novalidate id="formLogin">

<!-- USERNAME -->
<div class="form-group">
<label class="col-md-4 control-label">Username</label>
<div class="col-md-5">
<input type ="username" name="username" placeholder="inserisci username" class="form-control" id="username">
</div>
<span class="col-md-3"></span>
</div>

<!-- PASSWORD -->
<div class="form-group">
<label class="col-md-4 control-label">Password</label>
<div class="col-md-5">
<input type ="password" name="password" placeholder="inserisci password" class="form-control" id="myInput2"><br>
<input type="checkbox" onclick="myFunction()">Mostra password


</div>
<span class="col-md-3"></span>
</div>

<!-- BOTTONI -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type ="submit" value="Login" class="btn-basic">
<input type ="reset" value="Reset" class="btn-basic">
</div>
<span class="col-md-3"></span>
</div>
</form><!-- chiusura form login -->

<script type="text/javascript">
	$("#password").password('toggle');
</script>

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
<h3><br>Username o Password Sbagliati</h3>
<br>

<br>

</div>
<% } %>
</div><!-- chiusura container -->

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