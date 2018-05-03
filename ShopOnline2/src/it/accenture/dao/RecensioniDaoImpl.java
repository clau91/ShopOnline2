package it.accenture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.accenture.model.Prodotto;
import it.accenture.model.Recensioni;
import it.accenture.utilities.DBUtilityConnection;

public class RecensioniDaoImpl implements RecensioniDao{

	private Connection connection;
	private PreparedStatement prepared;
	private Statement statement;
	
	public RecensioniDaoImpl() {
		connection = DBUtilityConnection.getConnection();
		prepared = null;
	
	}
	
	@Override
	public void insertRecensione(Recensioni recensioni) {
		
		String query = "insert into recensione values "
				+ "(?,?,?,?)";
		
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, recensioni.getTitolo());
			prepared.setString(2, recensioni.getContenuto());
			prepared.setInt(3, recensioni.getIdUtente());
			prepared.setInt(4, recensioni.getIdProdotto());
			prepared.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(prepared!=null)
				try {
					prepared.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
}

	@Override
	public List<Recensioni> getAllByIdUtente(int IdUtente) {
		List<Recensioni> listaRecensioni = new ArrayList<>();
		String query = "select * from recensione where id_utente = "
				+ IdUtente;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				Recensioni recensioni = new Recensioni();
				recensioni.setTitolo(rs.getString(1));
				recensioni.setContenuto(rs.getString(2));
				recensioni.setIdUtente(rs.getInt(3));
				recensioni.setIdProdotto(rs.getInt(4));
				listaRecensioni.add(recensioni);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) {
					rs.close();
				}
				if(statement != null) {
					statement.close();
				}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}		
		return listaRecensioni;
	}

	
	@Override
	public List<Recensioni> getAllByIdProdotto(int idProdotto) {
		Prodotto prodotto = null;
		List<Recensioni> listaRecensioni = new ArrayList<>();
		String query = "select * from recensione where id_prodotto = "
				+ idProdotto;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				Recensioni recensioni = new Recensioni();
				recensioni.setTitolo(rs.getString(1));
				recensioni.setContenuto(rs.getString(2));
				recensioni.setIdUtente(rs.getInt(3));
				recensioni.setIdProdotto(idProdotto);
				listaRecensioni.add(recensioni);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) {
					rs.close();
				}
				if(statement != null) {
					statement.close();
				}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}		
	
		return listaRecensioni;
	}

	
	@Override
	public void close() {
		
		try {
			if(connection!= null) {
				
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
