package it.accenture.dao;

import java.util.List;

import it.accenture.model.Prodotto;

public interface RicercaDao {

	
	public List<Prodotto> getProdottiByKeyword(String keyword);
	
	public void close();
}
