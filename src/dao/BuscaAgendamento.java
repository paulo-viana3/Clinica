package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Agendamento;
import model.Paciente;

public class BuscaAgendamento {
	
	ArrayList<Agendamento> agenda = new ArrayList<Agendamento>();
	
	public ArrayList<Agendamento> buscaAgendamento(String cpf) {
		
		Connection conn = null;
		Agendamento a;
		
		try {
			String sql = "select a.idAgendamento, DATE_FORMAT(a.data,'%d/%m/%Y') as data,a.horario,m.nomeMedico,e.nomeEspecialidade,case a.status when 'A' then 'Agendado' when 'C' then 'Cancelado' when 'F' then 'Finalizado' else '' end as status from tbagendamento a join tbmedico m on m.idMedico = a.medico join tbespecialidade e on m.idEspecialidade = e.idEspecialidade join tbpaciente p on p.idPaciente = a.paciente where p.cpf = ? order by a.data, a.horario";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, cpf);
			ResultSet rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				a = new Agendamento();
				
				a.setIdAgendamento(rs.getInt("idAgendamento"));
				a.setDataformatada(rs.getString("data"));
				a.setHorario(rs.getString("horario"));
				a.setNomeMedico(rs.getString("nomeMedico"));
				a.setEspecialidade(rs.getString("nomeEspecialidade"));
				a.setStatus(rs.getString("status"));
				
				agenda.add(a);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return agenda;
	}	
	
	public int buscaTotalAgendamento(String crm,String data) {
		
		int total = 0;
		Connection conn = null;
		
		try {
			String sql = "select COUNT(idAgendamento) AS 'total' from tbagendamento a join tbmedico m on m.idMedico = a.medico  where m.crm = ? and a.data = ? and a.status = 'A'";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, crm);
			psmt.setString(2, data);
			ResultSet rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				total = rs.getInt("total");
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return total;
	}	

	public ArrayList<Agendamento> buscaAgendamentoM(String crm,String data) {
		
		Connection conn = null;
		Agendamento a;
		try {
			String sql = "select a.idAgendamento,DATE_FORMAT(a.data,'%d/%m/%Y') as data,a.horario,p.nome from tbagendamento a join tbmedico m on m.idMedico = a.medico join tbpaciente p on p.idPaciente = a.paciente where m.crm = ? and a.data = ? and a.status = 'A' order by a.data, a.horario";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, crm);
			psmt.setString(2, data);
			ResultSet rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				a = new Agendamento();
				
				a.setIdAgendamento(rs.getInt("idAgendamento"));
				a.setDataformatada(rs.getString("data"));
				a.setHorario(rs.getString("horario"));
				a.setNomePaciente(rs.getString("nome"));
				
				agenda.add(a);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return agenda;
	}	
	
	public Paciente buscaPaciente(int idAgenda) {
		Connection conn = null;
		Paciente p = new Paciente();

		try {
			String sql = "select p.nome, p.cpf, DATE_FORMAT(p.dataNasc,'%d/%m/%Y') as dataN from tbpaciente p join tbagendamento a on a.paciente = p.idpaciente where a.idagendamento = ?";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, idAgenda);
			ResultSet rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				p.setNome(rs.getString("nome"));
				p.setCpf(rs.getString("cpf"));
				p.setDataFormatada(rs.getString("dataN"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return p;
	}	
	
}
