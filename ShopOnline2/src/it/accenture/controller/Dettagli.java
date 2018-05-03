package it.accenture.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.accenture.dao.ProdottoDaoImpl;
import it.accenture.dao.RecensioniDaoImpl;
import it.accenture.model.Prodotto;
import it.accenture.model.Recensioni;

public class Dettagli extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Recensioni recensioni = null;
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		RecensioniDaoImpl recensioniService = new RecensioniDaoImpl();
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		List<Recensioni> listaRecensioni = (List<Recensioni>) recensioniService.getAllByIdProdotto(idProdotto); 
		System.out.println(listaRecensioni.size());
		System.out.println(prodotto);
		req.setAttribute("prodotto", prodotto);
		req.setAttribute("listaRecensioni", listaRecensioni);
		prodottoService.close();
		recensioniService.close();
		RequestDispatcher dispatcher = req.getRequestDispatcher("dettagli.jsp");
		dispatcher.forward(req, resp);

}
}