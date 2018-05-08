package it.accenture.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import it.accenture.model.Acquisto;
import it.accenture.model.Categoria;
import it.accenture.model.Prodotto;
import it.accenture.model.Spedizione;
import it.accenture.model.Utente;
import it.accenture.utilities.DBUtilityConnection;

public class AcquistoDaoImpl implements AcquistoDao {

	private Connection connection;
	private Statement statement;
	private PreparedStatement prepared;
	

	
	public AcquistoDaoImpl() {
		connection=DBUtilityConnection.getConnection();
		statement = null;
		prepared = null;
	}
	
	@Override
	public void acquistaProdotto (List<Acquisto> listaAcquisti) {
		for (Acquisto acquisto : listaAcquisti) {
		String query = "insert into acquisto values ("
				+ "acquisto_sequence.nextval,?,?,?,?,?,?,?)";
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, acquisto.getTipoSpedizione().toString().toLowerCase());
			prepared.setDate(2, Date.valueOf(acquisto.getDataInizio()));
			prepared.setDate(3, Date.valueOf(acquisto.getDataFine()));
			prepared.setDouble(4, acquisto.getPrezzoDiSpedizione());
			prepared.setInt(5, acquisto.getQuantitaAcquistata());
			prepared.setInt(6, acquisto.getIdUtente());
			prepared.setInt(7, acquisto.getIdProdotto());
			prepared.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(prepared!=null)
				try {
					prepared.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
	}


	@Override
	public void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Acquisto> getListaAcquisti(int idUtente) {
		List<Acquisto> listaAcquisti = new ArrayList<>();
		String query = "select * from acquisto where sysdate >= data_fine and id_utente = " + idUtente;
		ResultSet rs = null;
		try {
			statement=connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				Acquisto acquisto = new Acquisto();
				acquisto.setIdAcquisto(rs.getInt(1));
				acquisto.setTipoSpedizione(Spedizione.valueOf(rs.getString(2).toUpperCase()));
				acquisto.setDataInizio(rs.getDate(3).toLocalDate());
				acquisto.setDataFine(rs.getDate(4).toLocalDate());
				acquisto.setPrezzoDiSpedizione(rs.getDouble(5));
				acquisto.setQuantitaAcquistata(rs.getInt(6));
				acquisto.setIdUtente(idUtente);
				acquisto.setIdProdotto(rs.getInt(8));
				listaAcquisti.add(acquisto);		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(statement!=null) {
					statement.close();
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		return listaAcquisti;
	}
	

	@Override
	public List<Acquisto> getListaOrdini(int idUtente) {
		List<Acquisto> listaOrdini = new ArrayList<>();
		String query = "select * from acquisto where sysdate < data_fine and id_utente = " + idUtente;
		ResultSet rs = null;
		try {
			statement=connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				Acquisto acquisto = new Acquisto();
				acquisto.setIdAcquisto(rs.getInt(1));
				acquisto.setTipoSpedizione(Spedizione.valueOf(rs.getString(2).toUpperCase()));
				acquisto.setDataInizio(rs.getDate(3).toLocalDate());
				acquisto.setDataFine(rs.getDate(4).toLocalDate());
				acquisto.setPrezzoDiSpedizione(rs.getDouble(5));
				acquisto.setQuantitaAcquistata(rs.getInt(6));
				acquisto.setIdUtente(idUtente);
				acquisto.setIdProdotto(rs.getInt(8));
				listaOrdini.add(acquisto);		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(statement!=null) {
					statement.close();
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		return listaOrdini;
	}

	@Override
	public List<Acquisto> getAllByUtente(int idUtente) {
		List<Acquisto> listaCarrello = new ArrayList<>();
		String query = "select * from prodotto where id_utente = " + idUtente;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while (rs.next()) {
				Acquisto acquisto = new Acquisto();
				acquisto.setIdAcquisto(rs.getInt(1));
				acquisto.setTipoSpedizione(Spedizione.valueOf(rs.getString(2)));
				acquisto.setDataInizio(rs.getDate(3).toLocalDate());
				acquisto.setDataFine(rs.getDate(4).toLocalDate());
				acquisto.setPrezzoDiSpedizione(rs.getDouble(5));
				acquisto.setQuantitaAcquistata(rs.getInt(6));
				acquisto.setIdUtente(idUtente);
				acquisto.setIdProdotto(rs.getInt(8));
				listaCarrello.add(acquisto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				} 
				if(statement!=null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				}
			}
		return listaCarrello;
	}

	@Override
	public Acquisto getAcquistoById(int idAcquisto) {
		Acquisto acquisto = null;
		ResultSet rs = null;
		
		String query = "select * from acquisto where id_acquisto = " + idAcquisto;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			if (rs.next()) {
				acquisto = new Acquisto();
				acquisto.setIdAcquisto(idAcquisto);
				acquisto.setTipoSpedizione(Spedizione.valueOf(rs.getString(2).toUpperCase()));
				acquisto.setDataInizio(rs.getDate(3).toLocalDate());
				acquisto.setDataFine(rs.getDate(4).toLocalDate());
				acquisto.setPrezzoDiSpedizione(rs.getDouble(5));
				acquisto.setQuantitaAcquistata(rs.getInt(6));
				acquisto.setIdProdotto(rs.getInt(7));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return acquisto;
	
}
}