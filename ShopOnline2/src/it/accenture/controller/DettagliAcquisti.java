package it.accenture.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.accenture.dao.AcquistoDaoImpl;
import it.accenture.dao.ProdottoDaoImpl;
import it.accenture.dao.RecensioniDaoImpl;
import it.accenture.model.Acquisto;
import it.accenture.model.Prodotto;
import it.accenture.model.Recensioni;
import it.accenture.model.Utente;

public class DettagliAcquisti extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Recensioni recensioni = new Recensioni();
		Prodotto prodotto = new Prodotto();
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		int idAcquisto = Integer.parseInt(req.getParameter("idAcquisto"));
		Acquisto acquisto = acquistoService.getAcquistoById(idAcquisto);
		int idProdotto = acquisto.getIdProdotto();
		
		RecensioniDaoImpl recensioniService = new RecensioniDaoImpl();
		
		List<Recensioni> listaRecensioni = (List<Recensioni>) recensioniService.getAllByIdProdotto(idProdotto); 
		req.setAttribute("listaRecensioni", listaRecensioni);
		req.setAttribute("acquisto", acquisto);
		req.setAttribute("prodotto", prodotto);
		recensioniService.close();
		acquistoService.close();
		RequestDispatcher dispatcher = req.getRequestDispatcher("dettagliAcquisti.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");	
				
		String titolo = (req.getParameter("titolo"));
		String contenuto = (req.getParameter("contenuto"));
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		int idUtente = utenteLoggato.getIdUtente();

		
		Recensioni recensioni = new Recensioni();
		recensioni.setTitolo(titolo);
		recensioni.setContenuto(contenuto);
		recensioni.setIdUtente(idUtente);
		recensioni.setIdProdotto(idProdotto);
		
		RecensioniDaoImpl recensioniService = new RecensioniDaoImpl();
		recensioniService.insertRecensione(recensioni);
		List<Recensioni> listaRecensioni = (List<Recensioni>) recensioniService.getAllByIdProdotto(idProdotto); 
		recensioniService.close();
		
		listaRecensioni.add(recensioni);
		
		System.out.println(recensioni);
		
		req.setAttribute("listaRecensioni", listaRecensioni);
		resp.sendRedirect("DettagliAcquisti?idProdotto=" + idProdotto);
	}

}
