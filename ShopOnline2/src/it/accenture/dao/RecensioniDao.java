package it.accenture.dao;

import java.util.List;

import it.accenture.model.Recensioni;

public interface RecensioniDao {
	
	public void insertRecensione(Recensioni recensioni);
	
	public List<Recensioni> getAllByIdUtente(int IdUtente);
	
	public List<Recensioni> getAllByIdProdotto(int idProdotto);
	
	public void close();

}
