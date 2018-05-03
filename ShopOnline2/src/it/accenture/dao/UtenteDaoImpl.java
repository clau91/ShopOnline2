package it.accenture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.accenture.model.Utente;
import it.accenture.utilities.DBUtilityConnection;

public class UtenteDaoImpl implements UtenteDao {

	private Connection connection;
	private PreparedStatement prepared;
	
	public  UtenteDaoImpl() {
		connection = DBUtilityConnection.getConnection();
		prepared= null;
	}
	
	@Override
	public void registrazione(Utente utente) {
		String query ="insert into utente values "
				+ "(utente_sequence.nextval,?,?,?,?,?)";
		
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, utente.getNome());
			prepared.setString(2, utente.getCognome());
			prepared.setString(3, utente.getUsername());
			prepared.setString(4, utente.getPassword());
			prepared.setString(5, utente.getIndirizzo());
			prepared.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(prepared !=null)
				try {
						prepared.close();
				} catch (SQLException e) {
						e.printStackTrace();
				}
			}
		}

	
	
	@Override
	public Utente login(String username, String password) {
		
		Utente utente = null;
		ResultSet rs = null;
		String query = "select * from utente where username = ?"
				+ "and password = ?";
		
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, username);
			prepared.setString(2, password);
			rs = prepared.executeQuery();
			if(rs.next()) {
				utente = new Utente();
				utente.setIdUtente(rs.getInt(1));
				utente.setNome(rs.getString(2));
				utente.setCognome(rs.getString(3));
				utente.setUsername(rs.getString(4));
				utente.setPassword(rs.getString(5));
				utente.setIndirizzo(rs.getString(6));
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(prepared!=null) {
					prepared.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return utente;
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
	public void updateUtente(int idUtente) {
		String query ="update utente set nome = ? , cognome = ?, username = ?, password = ?, indirizzo = ? "
				+"where id_Utente = " + idUtente;
		
		Utente utente = null;
		ResultSet rs = null;
		
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(2,rs.getString(2));
			prepared.setString(3,rs.getString(3));
			prepared.setString(4,rs.getString(4));
			prepared.setString(5,rs.getString(5));
			prepared.setString(6,rs.getString(6));
			prepared.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(prepared != null) {
					prepared.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
