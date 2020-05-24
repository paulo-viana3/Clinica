package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Agendamento;

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
	
}
