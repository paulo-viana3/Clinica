package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.CallableStatement;

import model.Paciente;

public class ExecutaProcedure {
	
	public void execProc(int id) {
		Connection conn = null;
		Paciente p = new Paciente();
		try {
			conn = Conexao.getConexaoMySQL();
			CallableStatement cs = conn.prepareCall("CALL deletaRegistros(?)");  
            // setando parâmetros  
            cs.setInt("id", id);  
            
			System.out.println(id);
			
			cs.execute();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}

	}

}
