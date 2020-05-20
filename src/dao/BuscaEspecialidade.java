package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BuscaEspecialidade {

ArrayList<String> esp = new ArrayList<String>();

	public ArrayList<String> buscaEspecialidade() {
		Connection conn = null;

		try {
			String sql = "SELECT nomeEspecialidade FROM tbespecialidade";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				esp.add(rs.getString("nomeEspecialidade"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return esp;
	}
}
