package it.accenture.model;

import java.time.LocalDate;

public class Acquisto {
	
	private int idAcquisto;
	private Spedizione tipoSpedizione;
	private LocalDate dataInizio;
	private LocalDate dataFine = dataInizio + tipoSpedizione.getNumeroGiorni(numeroGiorni);
	private double prezzoDiSpedizione;
	private int quantitaAcquistata;
	private int idProdotto;
	private int idUtente;
	
	
	public int getIdAcquisto() {
		return idAcquisto;
	}
	public void setIdAcquisto(int idAcquisto) {
		this.idAcquisto = idAcquisto;
	}
	public Spedizione getTipoSpedizione() {
		return tipoSpedizione;
	}
	public void setTipoSpedizione(Spedizione tipoSpedizione) {
		this.tipoSpedizione = tipoSpedizione;
	}
	public LocalDate getDataInizio() {
		return dataInizio;
	}
	public void setDataInizio(LocalDate dataInizio) {
		this.dataInizio = dataInizio;
	}
	public LocalDate getDataFine() {
		return dataFine;
	}
	public void setDataFine(LocalDate dataFine) {
		this.dataFine = dataFine;
	}
	public double getPrezzoDiSpedizione() {
		return prezzoDiSpedizione;
	}
	public void setPrezzoDiSpedizione(double prezzoDiSpedizione) {
		this.prezzoDiSpedizione = prezzoDiSpedizione;
	}
	public int getQuantitaAcquistata() {
		return quantitaAcquistata;
	}
	public void setQuantitaAcquistata(int quantitaAcquistata) {
		this.quantitaAcquistata = quantitaAcquistata;
	}
	public int getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	public int getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	
	@Override
	public String toString() {
		return "Acquisto [idAcquisto=" + idAcquisto + ", tipoSpedizione=" + tipoSpedizione + ", dataInizio="
				+ dataInizio + ", dataFine=" + dataFine + ", prezzoDiSpedizione=" + prezzoDiSpedizione
				+ ", quantitaAcquistata=" + quantitaAcquistata + ", idProdotto=" + idProdotto + ", idUtente=" + idUtente
				+ "]";
	}
	
	

}
