package it.accenture.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.accenture.dao.ProdottoDaoImpl;
import it.accenture.model.Prodotto;

public class Dettagli extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		System.out.println(prodotto);
		req.setAttribute("prodotto", prodotto);
		prodottoService.close();
		RequestDispatcher dispatcher = req.getRequestDispatcher("dettagli.jsp");
		dispatcher.forward(req, resp);

}
}