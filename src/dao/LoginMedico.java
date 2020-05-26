package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Medico;

public class LoginMedico {
	public boolean login(Medico m) {

		Connection conn = null;

		try {
			String sql = "SELECT * FROM TBMEDICO WHERE CRM=? AND SENHA=?";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, m.getCrm());
			psmt.setString(2, m.getSenha());

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				m.setId(rs.getInt("idMedico"));
				m.setNome(rs.getString("nomeMedico"));
				m.setCrm(rs.getString("crm"));
				m.setIdEspecialidade(rs.getInt("idEspecialidade"));
				m.setSenha(rs.getString("senha"));
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return false;
	}
	
	public String buscaNome(String crm) {

		Connection conn = null;
		String nome="";
		try {
			String sql = "SELECT nomeMedico FROM TBMEDICO WHERE CRM=?";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, crm);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				nome = rs.getString("nomeMedico");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return nome;
	}
	
}
