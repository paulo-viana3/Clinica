package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Paciente;

public class LoginPaciente {
	public boolean login(Paciente p) {

		Connection conn = null;

		try {
			String sql = "SELECT * FROM TBPACIENTE WHERE CPF=? AND SENHA=?";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, p.getCpf());
			psmt.setString(2, p.getSenha());

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				p.setIdPaciente(rs.getInt("idPaciente"));
				p.setTelContato(rs.getString("telContato"));
				p.setNome(rs.getString("nome"));
				p.setDataNasc(rs.getDate("dataNasc"));
				p.setEmail(rs.getString("email"));
				p.setCpf(rs.getString("cpf"));
				p.setSenha(rs.getString("senha"));
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return false;
	}
}
