<%@page import="it.accenture.model.Prodotto"%>
<%@page import="java.util.List"%>
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


<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>USER PROFILE</h1>
<p></p>
</div><!-- chiusura jumbotron -->

<br>
<br>
<br>
<br>
<br>

<div class="container"  style="margin-left:80px">

<h3>Nome: <%=utente.getNome() %></h3>
<h3>Cognome: <%=utente.getCognome() %></h3>
<h3>Username: <%=utente.getUsername() %></h3>
<h3>Password: <%=utente.getPassword() %></h3>
<h3>Indirizzo: <%=utente.getIndirizzo() %></h3>

<br>

<p><a href="updateAccount.jsp">Clicca qui</a> per modificare i dati</p>



</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>



<!-- FOOTER -->
<div class="container-fluid text-center text-md-left">
<div class="footer">
<br>

<div class="col-md-3" align="center"> 
  <h5 style="font-size: 25px; width: 250px; margin-top: 0px">MODALITA DI PAGAMENTO</h5>
  <img src="img/mastercard.jpg" class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="MasterCard">
  <img src="img/paypal.jpg"     class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="PayPal">
  <img src="img/visa.jpg"       class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="Visa"> 
  <img src="img/postepay.jpg"   class="icona"  class="a-popover"   data-toggle="popover"  data-trigger="hover" title="PostePay"> 
  <img src="img/Americanexpress.png" class="icona" class="a-popover"  data-toggle="popover" data-trigger="hover" title="American Express"> 	
</div>

<div class="col-md-3" align="center">
<ul class="list-unstyled">
<li style="font-size: 25px; width: 250px"><a href="registrazione.jsp?form=login"><u>AREA RISERVATA</u></a></li>
</ul>
</div>
     
<div class="col-md-3" align="center">
<ul class="list-unstyled">
<li style="font-size: 25px; width: 250px"><a href="contatti.jsp"><u>CHI SIAMO</u></a></li>
</ul>
</div>          

<div class="col-md-3" align="center">
<h5 style="font-size: 25px; width: 250px; margin-top: 0px">SPEDITO DA</h5>
    <img src="img/posteitaliane.jpg"  class="icona" class="a-popover"  data-toggle="popover" data-trigger="hover" title="Poste Italiane">
    <img src="img/DHL.png"   class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="DHL">
 	<img src="img/TNT.jpg"  class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="TNT">
 	<img src="img/Sda.jpg"   class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="SDA">
 	<img src="img/gls.jpeg"  class="icona" class="a-popover"   data-toggle="popover"  data-trigger="hover" title="GLS">
</div>   

<br> 
<br>
<br>

    


 <!--Copyright-->
<div class="footer-copyright py-3 text-center">
<h5 style="font-size: 20px"><img src="img/logo.png" class="icona" class="a-popover" data-toggle="popover" data-trigger="hover" title="WEforSPORTS">&copy;SPORTSADDICTED 2018 - Partita IVA: 012345612132 - Tutti i diritti riservati</h5>
</div>
<br>

</div>
</div>
   
<!-- FINE FOOTER-->

</body>
</html>