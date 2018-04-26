package it.accenture.model;

public enum Spedizione {
	
	PRIORITARIA(1),
	RAPIDA(2),
	ORDINARIA(3);
	
	private int numeroGiorni;

	
	private Spedizione(int numeroGiorni) {
		this.numeroGiorni = numeroGiorni;
	}

	public int getNumeroGiorni() {
		return numeroGiorni;
	}

	public void setNumeroGiorni(int numeroGiorni) {
		this.numeroGiorni = numeroGiorni;
	}
	
	
	
	
	
	
	

}
