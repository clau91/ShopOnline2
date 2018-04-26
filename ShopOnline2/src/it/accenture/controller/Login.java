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

public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UtenteDaoImpl utenteService = new UtenteDaoImpl();
		Utente utente = utenteService.login(username, password);
		System.out.println(utente);
		
		if(utente == null) {
			System.out.println("Credenziali Sbagliate");
			req.setAttribute("errore", true);
			RequestDispatcher dispatcher = req.getRequestDispatcher("registrazione.jsp?form=login");
			dispatcher.forward(req, resp);
			
		} else {
			System.out.println("Login Effettuato");
			HttpSession sessione = req.getSession();
			sessione.setAttribute("utenteLoggato", utente);
			resp.sendRedirect("index.jsp");
			
		}
	}
}
