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
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<%List<Prodotto> listaProdotti = (List<Prodotto>) request.getAttribute("listaProdotti"); %>



<div class="container">
<div class="table-responsive">
<table class="table">
<!-- table head -->
<thead>
<tr>
<th>Nome</th>
<th>Marca</th>
<th>Prezzo </th>
<th>Quantità Disponibile</th>
<th>Acquista</th>
</tr>
</thead>
<!-- table body -->
<tbody>
<%for(Prodotto prodotto : listaProdotti){%>
<tr>
<td><%=prodotto.getNome() %></td>
<td><%=prodotto.getMarca() %></td>
<td><%=prodotto.getPrezzo() %></td>
<td><%=prodotto.getQuantitaDisponibile()%></td>

<td>
<form action="ListaProdotti" method="post">
<input type="hidden" name="nome" value="<%=prodotto.getNome()%>">
<input type="submit" value="Acquista"
<%if(prodotto.getQuantitaDisponibile() > 0){%>
class="btn btn-success"
<% }else{%>
class="btn btn-warning"
<%} %>
<%if(utente == null) {%>
disabled
<% }%>
>
</form>

</td>
</tr>
<%} %>
</tbody>

</table>

</div>

</div><!-- chiusura container -->
</body>
</html>