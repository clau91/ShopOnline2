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

public class ProfiloUtente extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String indirizzo = req.getParameter("indirizzo");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UtenteDaoImpl utenteService = new UtenteDaoImpl();
		Utente utente = utenteService.login(username, password);
		
		if(utente == null) {
			req.setAttribute("errore", true);
			RequestDispatcher dispatcher = req.getRequestDispatcher("profiloUtente.jsp?form=login");
			dispatcher.forward(req, resp);
			
		} else {
			HttpSession sessione = req.getSession();
			sessione.setAttribute("utenteLoggato", utente);
			resp.sendRedirect("index.jsp");
			
		}
	}
}
	