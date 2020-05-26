package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Agendamento;
import model.Paciente;

public class AgendarConsulta {

	public boolean novo(Agendamento a)  {
		Connection conn = null;
		
		try {
			
			String sql = "insert into tbagendamento (data, medico, paciente, status, horario, diagnostico, prescricao)" +
							"values (?, ?, ?, ?, ?, ?, ?)";
			
			conn = Conexao.getConexaoMySQL();
			
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setDate(1, a.getData());
			pstm.setInt(2, a.getIdMedico());
			pstm.setInt(3, a.getIdPaciente());
			pstm.setString(4, a.getStatus());
			pstm.setString(5, a.getHorario());
			pstm.setString(6, a.getDiagnostico());
			pstm.setString(7, a.getPrescricao());

			pstm.execute();

			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Conexao.FecharConexao();
		}
		return false;
	}

	public Agendamento finalizaConsulta(Agendamento a) {
		Connection conn = null;
		try {
			String sql = "UPDATE TBAGENDAMENTO SET DIAGNOSTICO = ?, PRESCRICAO = ? WHERE IDAGENDAMENTO=?";
			conn = Conexao.getConexaoMySQL();
			
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(1, a.getDiagnostico());
			pstm.setString(2, a.getPrescricao());

			pstm.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Conexao.FecharConexao();
		}
		return a;
	}
	
}
