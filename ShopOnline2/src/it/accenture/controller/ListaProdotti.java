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
import it.accenture.model.Categoria;
import it.accenture.model.Prodotto;

public class ListaProdotti extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Categoria categoria = (Categoria) req.getAttribute("categoria");
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		Prodotto prodotto = (Prodotto) prodottoService.getProdottiPerCategoria(categoria);
		System.out.println(categoria);
		req.setAttribute("categoria", categoria);
		prodottoService.close();
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, resp);
	}
}
