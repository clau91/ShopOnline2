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

import it.accenture.dao.AcquistoDaoImpl;
import it.accenture.dao.ProdottoDaoImpl;
import it.accenture.model.Acquisto;
import it.accenture.model.Prodotto;
import it.accenture.model.Spedizione;
import it.accenture.model.Utente;





public class Acquista extends HttpServlet {
		
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int idAcquisto = Integer.parseInt(req.getParameter("idAcquisto"));
		String tipoSpedizione = req.getParameter("tipoSpedizione");
		String dataInizioString = req.getParameter("dataInizio");
		String dataFineString = req.getParameter("dataFine");
		LocalDate dataInizio = LocalDate.parse(dataInizioString);
		LocalDate dataFine = LocalDate.parse(dataFineString);
		double prezzoDiSpedizione = Double.parseDouble(req.getParameter("prezzoDiSpedizione"));
		int quantitaAcquistata = Integer.parseInt(req.getParameter("quantitaAcquistata"));
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		
		Spedizione spedizione1 = Spedizione.valueOf(tipoSpedizione);
		
		HttpSession sessione = req.getSession();
		Utente utenteLoggato = (Utente) sessione.getAttribute("utenteLoggato");
		
		Acquisto acquisto = new Acquisto();
		acquisto.setTipoSpedizione(spedizione1);
		acquisto.setDataInizio(dataInizio);
		acquisto.setDataFine(dataFine);
		acquisto.setPrezzoDiSpedizione(prezzoDiSpedizione);
		acquisto.setQuantitaAcquistata(quantitaAcquistata);
		acquisto.setIdProdotto(idProdotto);
		acquisto.setIdUtente(utenteLoggato.getIdUtente());

		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		acquistoService.acquistaProdotto(acquisto);
		acquistoService.close();
		
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		prodottoService.updateQuantitaDisponibile(idProdotto);
		prodottoService.close();
		
				
	}
	
	

}
