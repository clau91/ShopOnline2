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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");
		
		List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello");
		List<Acquisto> listaOrdini = new ArrayList<>();
		List<Integer> listaQuantita = (List<Integer>) session.getAttribute("listaQuantita");
		
	
		for (Prodotto prodotto : listaCarrello) {
			
		String tipoSpedizione = req.getParameter("tipoSpedizione");
		Spedizione spedizione = Spedizione.valueOf(tipoSpedizione);
		

		LocalDate dataInizio = LocalDate.now();
		LocalDate dataFine = dataInizio.plusDays(spedizione.getNumeroGiorni());
		double prezzoDiSpedizione = spedizione.getPrezzoSpedizione();
		int idUtente = utenteLoggato.getIdUtente();
		int idProdotto = (prodotto.getIdProdotto());
			
		Acquisto acquisto = new Acquisto();


		acquisto.setTipoSpedizione(spedizione);
		acquisto.setDataInizio(dataInizio);
		acquisto.setDataFine(dataFine);
		acquisto.setPrezzoDiSpedizione(prezzoDiSpedizione);
		
		
		
		
		
		acquisto.setQuantitaAcquistata(listaQuantita.get(listaCarrello.indexOf(prodotto)));
		
		acquisto.setIdProdotto(idProdotto);
		acquisto.setIdUtente(idUtente);

		listaOrdini.add(acquisto);
		
		
		int nuovaQuantita = prodotto.getQuantitaDisponibile() - acquisto.getQuantitaAcquistata();
		
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		prodottoService.updateQuantitaDisponibile(idProdotto, nuovaQuantita);
		prodottoService.close();
		
		double sommaTotale = (prodotto.getPrezzo()*acquisto.getQuantitaAcquistata()) + acquisto.getPrezzoDiSpedizione();
		
		req.setAttribute("sommaTotale", sommaTotale);
		System.out.println(sommaTotale);

		

		} 
		
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		acquistoService.acquistaProdotto(listaOrdini);
		acquistoService.close();
		
		listaCarrello.clear();
		listaQuantita.clear();
		
		System.out.println("Acquisto effettuato");
		System.out.println(listaOrdini);
		
		resp.sendRedirect("ListaOrdini");

	}
	
	
	
	
	

}
