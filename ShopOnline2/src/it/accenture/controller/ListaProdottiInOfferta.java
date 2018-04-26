package it.accenture.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.accenture.dao.ProdottoDaoImpl;
import it.accenture.model.Prodotto;

public class ListaProdottiInOfferta extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Prodotto> listaProdottiInOfferta = new ArrayList<>();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		listaProdottiInOfferta = prodottoService.getProdottiOfferta();
		System.out.println(listaProdottiInOfferta);
		System.out.println("Numero degli Prodotti in Offerta:" +listaProdottiInOfferta.size());
		prodottoService.close();
		req.setAttribute("listaProdottiInOfferta", listaProdottiInOfferta);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdottiInOfferta.jsp");
		dispatcher.forward(req, resp);
		
	}

}
