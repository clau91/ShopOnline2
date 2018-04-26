package it.accenture.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.accenture.model.Acquisto;
import it.accenture.model.Cliente;
import it.accenture.model.Prodotto;
import it.accenture.model.Spedizione;
import it.accenture.model.Utente;





public class Acquista extends HttpServlet {
	
	double prezzoTotale = 0;
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Prodotto prodotto = new Prodotto();
		Acquisto acquisto = new Acquisto();
		int idAcquisto = Integer.parseInt(req.getParameter("idAcquisto"));
		Spedizione tipoSpedizione = req.getParameter("tipoSpedizione");
		String dataInizio = req.getParameter("dataInizio");
		String dataFine = req.getParameter("dataFine"); 
		double prezzoDiSpedizione = Double.parseDouble(req.getParameter("prezzoSpedizione"));
		String quantitaAcquistata = req.getParameter("quantitaAcquistata");
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		String idUtente = req.getParameter("idUtente");
		
		double prezzoTotale = (prodotto.getPrezzo() * acquisto.getQuantitaAcquistata()) + 
				acquisto.getTipoSpedizione().getPrezzoSpedizione(); 
		
		HttpSession sessione = req.getSession();
		Utente utenteLoggato = (Utente) sessione.getAttribute("utenteLoggato");
		
		acquisto.setIdProdotto(idProdotto);
		acquisto.setIdAcquisto(idAcquisto);
		acquisto.setIdUtente(utenteLoggato.getIdUtente());
		acquisto.setTipoSpedizione(tipoSpedizione);
				
	}
	
	

}
