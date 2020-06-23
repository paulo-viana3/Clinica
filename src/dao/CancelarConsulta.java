package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Agendamento;

public class CancelarConsulta {

	public boolean cancela(int id)  {
		Connection conn = null;
		
		try {
			
			String sql = "delete from tbagendamento where idagendamento = ?";
			
			conn = Conexao.getConexaoMySQL();
			
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setInt(1, id);

			pstm.execute();

			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Conexao.FecharConexao();
		}
		return false;
	}
}
