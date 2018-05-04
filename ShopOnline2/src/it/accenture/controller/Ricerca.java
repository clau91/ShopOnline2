package it.accenture.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.accenture.dao.ProdottoDaoImpl;

import it.accenture.model.Prodotto;

public class Ricerca extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword=req.getParameter("keyword");
		System.out.println(keyword);
		List<Prodotto> listaProdottiByKeyword = new ArrayList<>();
		ProdottoDaoImpl ricercaService = new ProdottoDaoImpl();
		listaProdottiByKeyword = ricercaService.getProdottiByKeyword(keyword);
		ricercaService.close();
		System.out.println(listaProdottiByKeyword);
		req.setAttribute("listaProdotti", listaProdottiByKeyword);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti.jsp");
		dispatcher.forward(req, resp);
		
		
	}
}
