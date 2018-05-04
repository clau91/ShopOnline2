package it.accenture.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.accenture.dao.ProdottoDaoImpl;
import it.accenture.dao.RecensioniDaoImpl;
import it.accenture.model.Prodotto;
import it.accenture.model.Recensioni;
import it.accenture.model.Utente;

public class Dettagli extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Recensioni recensioni = new Recensioni();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		RecensioniDaoImpl recensioniService = new RecensioniDaoImpl();
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		List<Recensioni> listaRecensioni = (List<Recensioni>) recensioniService.getAllByIdProdotto(idProdotto); 
		req.setAttribute("prodotto", prodotto);
		req.setAttribute("listaRecensioni", listaRecensioni);
		prodottoService.close();
		recensioniService.close();
		RequestDispatcher dispatcher = req.getRequestDispatcher("dettagli.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");	
				
		String titolo = (req.getParameter("titolo"));
		String contenuto = (req.getParameter("contenuto"));
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));

		
		Recensioni recensioni = new Recensioni();
		recensioni.setTitolo(titolo);
		recensioni.setContenuto(contenuto);
		recensioni.setIdUtente(utenteLoggato.getIdUtente());
		recensioni.setIdProdotto(idProdotto);
		
		RecensioniDaoImpl recensioniService = new RecensioniDaoImpl();
		recensioniService.insertRecensione(utenteLoggato.getIdUtente(), idProdotto);
		recensioniService.close();

		List<Recensioni> listaRecensioni = (List<Recensioni>) recensioniService.getAllByIdProdotto(idProdotto); 

		listaRecensioni.add(recensioni);
		
		req.setAttribute("listaRecensioni", listaRecensioni);
		resp.sendRedirect("Dettagli?idProdotto=" + idProdotto);
	}
}