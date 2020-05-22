package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Medico;

public class BuscaMedico {

	ArrayList<Medico> esp = new ArrayList<Medico>();

	public ArrayList<Medico> buscaMedico(int codigo) {
		Connection conn = null;
		
		try {
			String sql = "SELECT idMedico,nomeMedico FROM tbmedico where idEspecialidade = ?";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, codigo);
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Medico m = new Medico();
				
				m.setId(rs.getInt("idMedico"));
				m.setNome(rs.getString("nomeMedico"));
				
				esp.add(m);
			}
			//System.out.println(esp.size());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return esp;
	}
	
}