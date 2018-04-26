<%@page import="it.accenture.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME</title>
</head>
<body>

<% Utente utente = (Utente) session.getAttribute("clienteLoggato"); %>
<!-- NAVBAR -->
<nav class="nav navbar-inverse">
<div class="navbar-header div-icona-home">
<a href="index.jsp">
<img src="img/homeicon.png" class="icona-home">
</a>
</div><!-- navbar header -->
<div class="collapse navbar-collapse">
<ul class="nav navbar-nav">
<li><a href="ListaProdotti">Lista Prodotti</a></li>
<li><a href="ListaProdottiInOfferta">Lista Prodotti in Offerta</a></li>
<li><a href="ListaProdottiPerCategoria">Lista Prodotti per Categoria</a></li>
<% if (utente == null) { %>
<li><a href="registrazione.jsp?form=registrazione">Registrazione</a></li>
<li><a href="registrazione.jsp?form=login">Login</a></li>
<%} else { %>
<li><a href="ListaPrenotazioni">Lista Prenotazioni</a></li>
<li><a href="Logout.jsp">Logout</a></li>
<% } %>
</ul>
</div><!-- chiusura navbar body -->
</nav><!-- chiusura navbar  -->

<!-- JUMBOTRON -->
<div class="jumbotron">
<h1>WELCOME TO SPORTADDICTED</h1>
<p></p>
</div><!-- chiusura jumbotron -->

<!-- DIV CONTAINER -->
<div class="container">

<!-- CAROUSEL -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
<!-- immagini -->
<div class="carousel-inner">
<div class="item active">
<img class="img-carousel" src="img/hotel1.jpg">
</div>
<div class="item">
<img class="img-carousel" src="img/hotel2.jpg">
</div>
<div class="item">
<img class="img-carousel" src="img/hotel3.jpg">
</div>
</div>
<!-- INDICATORI -->
<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel" data-slide-to="1"></li>
<li data-target="#myCarousel" data-slide-to="2"></li>
</ol>
<!-- FRECCE -->
<a class="left carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
</a>
<a class="right carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
</a>

</div><!-- CHIUSURA CAROUSEL -->


</div><!-- CHIUSURA CONTAINER -->

</body>
</html>