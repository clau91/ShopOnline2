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
		
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String indirizzo = req.getParameter("indirizzo");
		
		Utente utente = new Utente();
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setUsername(username);
		utente.setPassword(password);
		utente.setIndirizzo(indirizzo);
		UtenteDaoImpl utenteService = new UtenteDaoImpl();
		utenteService.updateUtente(idUtente);
		System.out.println("utente aggiornato");
		utenteService.close();
	    RequestDispatcher dispatcher = req.getRequestDispatcher("profiloUtente.jsp?form=updateAccount");
	    dispatcher.forward(req, resp);
		
			
		
		}
	}

