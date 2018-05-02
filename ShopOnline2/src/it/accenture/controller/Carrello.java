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
import it.accenture.model.Acquisto;
import it.accenture.model.Prodotto;
import it.accenture.model.Utente;

public class Carrello extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Acquisto> carrello = new ArrayList<>(); 
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		HttpSession sessione = req.getSession();
		Utente utenteLoggato = (Utente) sessione.getAttribute("utenteLoggato");
		carrello = acquistoService.getListaOrdini(utenteLoggato.getIdUtente());
		for(Acquisto acquisto : carrello){
			System.out.println(acquisto);
		}
		req.setAttribute("carrello", carrello);
		RequestDispatcher dispatcher = req.getRequestDispatcher("carrello.jsp");
		dispatcher.forward(req, resp);
	}

}
