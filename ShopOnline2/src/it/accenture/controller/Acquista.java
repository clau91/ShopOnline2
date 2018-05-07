package it.accenture.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import it.accenture.model.Prodotto;
import it.accenture.model.Spedizione;
import it.accenture.model.Utente;





public class Acquista extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int idProdotto =Integer.parseInt(req.getParameter("idProdotto"));
		System.out.println("prodotto selezionato : " + idProdotto);
		req.setAttribute("idProdotto", idProdotto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("acquista.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");
		
		List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello");
		List<Acquisto> listaOrdini = new ArrayList<>();
		
		for (Prodotto prodotto : listaCarrello) {
			
		String tipoSpedizione = req.getParameter("tipoSpedizione");
		Spedizione spedizione = Spedizione.valueOf(tipoSpedizione);
		System.out.println(spedizione);
		System.out.println(spedizione.getPrezzoSpedizione());
		System.out.println(spedizione.getNumeroGiorni());

		LocalDate dataInizio = LocalDate.now();
		LocalDate dataFine = dataInizio.plusDays(spedizione.getNumeroGiorni());
		double prezzoDiSpedizione = spedizione.getPrezzoSpedizione();
		int quantitaAcquistata = Integer.parseInt(req.getParameter("quantitaAcquistata"));
		int idUtente = utenteLoggato.getIdUtente();
		int idProdotto = (prodotto.getIdProdotto());
				

		
		Acquisto acquisto = new Acquisto();
		acquisto.setTipoSpedizione(spedizione);
		acquisto.setDataInizio(dataInizio);
		acquisto.setDataFine(dataFine);
		acquisto.setPrezzoDiSpedizione(prezzoDiSpedizione);
		acquisto.setQuantitaAcquistata(quantitaAcquistata);
		acquisto.setIdProdotto(idProdotto);
		acquisto.setIdUtente(idUtente);

		listaOrdini.add(acquisto);

		
		} 
		
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		acquistoService.acquistaProdotto(listaOrdini);
		acquistoService.close();
			
		
		System.out.println("Acquisto effettuato");
		System.out.println(listaOrdini);
		
		resp.sendRedirect("ListaOrdini");

	}
	
	

}
