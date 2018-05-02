package it.accenture.dao;

import java.util.List;

import it.accenture.model.Categoria;
import it.accenture.model.Prodotto;

public interface ProdottoDao {
	
	public List<Prodotto> getAllProdotti();
	
	public Prodotto getProdottoById(int idProdotto);
	
	public List<Prodotto> getProdottiOfferta();
	
	public List<Prodotto> getProdottiPerCategoria(Categoria categoria);
	
	public void updateQuantitaDisponibile(int idProdotto);
		
	public void close();



	
	

}
