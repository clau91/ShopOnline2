package it.accenture.dao;

import java.util.List;

import it.accenture.model.Acquisto;
import it.accenture.model.Prodotto;

public interface AcquistoDao {

	public void acquistaProdotto(List<Acquisto> listaAcquisti);
	
	public List<Acquisto> getAllByUtente(int idUtente);
	
	public List<Acquisto> getListaAcquisti(int idUtente);
	
	public List<Acquisto> getListaOrdini(int idUtente);
	
	public void close();
	
	
}
