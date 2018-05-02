package it.accenture.model;

public enum Spedizione {
	
	PRIORITARIA(1, 10),
	RAPIDA(2, 5),
	ORDINARIA(3, 3);
	


	private static int numeroGiorni;
	private static double prezzoSpedizione;

	
	private Spedizione(int numeroGiorni, double prezzoSpedizione) {
	
	}
	
	public static double getPrezzoSpedizione() {
		return prezzoSpedizione;
	}

	public void setPrezzoSpedizione(double prezzoSpedizione) {
		this.prezzoSpedizione = prezzoSpedizione;
	}

	public static int getNumeroGiorni() {
		return numeroGiorni;
	}

	public void setNumeroGiorni(int numeroGiorni) {
		this.numeroGiorni = numeroGiorni;
	}
	
	
	
	
	
	
	

}
