package it.accenture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.accenture.model.Categoria;
import it.accenture.model.Prodotto;
import it.accenture.utilities.DBUtilityConnection;

public class RicercaDaoImpl implements RicercaDao{
	private Connection connection;
	private Statement statement;
	private PreparedStatement prepared;
	
	public RicercaDaoImpl() {
		connection = DBUtilityConnection.getConnection();
		statement = null;
		prepared = null;
	}
	
	@Override
	public List<Prodotto> getProdottiByKeyword(String keyword) {
		
	
		List<Prodotto> listaProdottiByKeyword = new ArrayList<>();
		ResultSet rs = null;
		String query = "select * from prodotto where nome like " + "'" + keyword + "'";
		try{
		statement = connection.createStatement();
		rs = statement.executeQuery(query);
		
		while(rs.next()) {
			Categoria categoria = null;
			Prodotto prodotto = new Prodotto();
			prodotto.setIdProdotto(rs.getInt(1));
			prodotto.setNome(rs.getString(2));
			prodotto.setCategoria(categoria);
			prodotto.setMarca(rs.getString(4));
			prodotto.setPrezzo(rs.getDouble(5));
			prodotto.setOfferta(rs.getBoolean(6));
			prodotto.setSconto(rs.getInt(7));
			prodotto.setQuantitaDisponibile(rs.getInt(8));
			prodotto.setImmagine(rs.getString(9));
			listaProdottiByKeyword.add(prodotto);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(statement!=null)
					statement.close();
			} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return listaProdottiByKeyword;
		}

	@Override
	public void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	}