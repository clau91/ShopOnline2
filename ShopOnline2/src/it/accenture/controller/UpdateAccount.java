package it.accenture.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.accenture.dao.UtenteDaoImpl;
import it.accenture.model.Utente;

public class UpdateAccount extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession sessione = req.getSession();
		Utente utenteLoggato = (Utente) sessione.getAttribute("utenteLoggato");
		UtenteDaoImpl utenteService = new UtenteDaoImpl();

		
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String indirizzo = req.getParameter("indirizzo");
		
		utenteLoggato.setNome(nome);
		utenteLoggato.setCognome(cognome);
		utenteLoggato.setUsername(username);
		utenteLoggato.setPassword(password);
		utenteLoggato.setIndirizzo(indirizzo);
		
		utenteService.updateUtente(utenteLoggato);
		System.out.println("Dati aggiornati");
		utenteService.close();
		RequestDispatcher dispatcher = req.getRequestDispatcher("profiloUtente.jsp");
		dispatcher.forward(req, resp);
	}	    
	    
}
	

