package it.accenture.dao;

import java.util.List;

import it.accenture.model.Acquisto;
import it.accenture.model.Categoria;
import it.accenture.model.Prodotto;

public interface ProdottoDao {
	
	public List<Prodotto> getAllProdotti();
	
	public Prodotto getProdottoById(int idProdotto);
	
	public List<Prodotto> getProdottiOfferta();
	
	public List<Prodotto> getProdottiPerCategoria(Categoria categoria);
	
	public void updateQuantitaDisponibile(int idProdotto, int quantita);
	
	public List<Prodotto> getProdottiByKeyword(String keyword);
	
	public List<Prodotto> getTop3Venduti();
		
	public void close();



	
	

}
