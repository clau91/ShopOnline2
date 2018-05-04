package it.accenture.model;

public enum Spedizione {
	
	PRIORITARIA(1, 10),
	RAPIDA(3, 5),
	ORDINARIA(5, 3);
	


	private int numeroGiorni;
	private double prezzoSpedizione;

	
	private Spedizione(int numeroGiorni, double prezzoSpedizione) {
		this.numeroGiorni = numeroGiorni;
		this.prezzoSpedizione = prezzoSpedizione;
	}
	
	public  double getPrezzoSpedizione() {
		return prezzoSpedizione;
	}

	public void setPrezzoSpedizione(double prezzoSpedizione) {
		this.prezzoSpedizione = prezzoSpedizione;
	}

	public int getNumeroGiorni() {
		return numeroGiorni;
	}

	public void setNumeroGiorni(int numeroGiorni) {
		this.numeroGiorni = numeroGiorni;
	}
	
	
	
	
	
	
	

}
