package it.accenture.dao;

import java.util.List;

import it.accenture.model.Acquisto;

public interface AcquistoDao {

	public void AcquistaProdotto(Acquisto acquisto);
	
	public List<Acquisto> getListaAcquisti(int idUtente);
	
	public List<Acquisto> getListaOrdini(int idUtente);
	
	public void close();
	
	
}
