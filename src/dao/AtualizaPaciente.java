package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Paciente;

public class AtualizaPaciente {

	public Paciente atualizaPaciente(Paciente p) {
		Connection conn = null;
		try {
			String sql = "UPDATE TBPACIENTE SET NOME = ?, TELCONTATO = ?, EMAIL = ?, DATANASC = ?, SENHA = ?  WHERE CPF=?";
			conn = Conexao.getConexaoMySQL();
			
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(1, p.getNome());
			pstm.setString(2, p.getTelContato());
			pstm.setString(3, p.getEmail());
			pstm.setDate(4, p.getDataNasc());
			pstm.setString(5, p.getSenha());
			pstm.setString(6, p.getCpf());

			pstm.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Conexao.FecharConexao();
		}
		return p;
	}
	
	public Paciente retornSenha(String cpf) {
		Connection conn = null;
		Paciente p = new Paciente();
		try {
			String sql = "SELECT SENHA FROM TBPACIENTE WHERE CPF=?";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, cpf);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				p.setSenha(rs.getString("senha"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return p;
	}
	
}
