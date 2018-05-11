package it.accenture.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.accenture.dao.AcquistoDaoImpl;
import it.accenture.dao.ProdottoDaoImpl;
import it.accenture.model.Acquisto;
import it.accenture.model.Categoria;
import it.accenture.model.Prodotto;
import it.accenture.model.Utente;

public class Carrello4 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Categoria categoria = Categoria.valueOf(req.getParameter("categoria"));		
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello");
		int quantitaAcquistata = Integer.parseInt(req.getParameter("quantitaAcquistata"));
		List<Integer> listaQuantita = (List<Integer>) session.getAttribute("listaQuantita");

		
		if (listaCarrello == null) {
			listaCarrello = new ArrayList<>();
		}
		
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		Prodotto prodotto = new Prodotto();
		prodotto = prodottoService.getProdottoById(idProdotto);
		prodottoService.close();
		listaCarrello.add(prodotto);
		
		if (listaQuantita == null) {
			listaQuantita = new ArrayList<>();
		}
		
		listaQuantita.add(quantitaAcquistata);
		

		session.setAttribute("listaQuantita", listaQuantita);
		session.setAttribute("listaCarrello", listaCarrello);
		
		
		resp.sendRedirect("ListaProdottiPerCategoria?categoria=" + categoria);
		}
}
