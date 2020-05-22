package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BuscaAgendamento {
	
	String[][] lista = new String[10][5];
	//ArrayList<String> agenda = new ArrayList<String>();

	public String[][] buscaAgendamento(String cpf) {
		Connection conn = null;

		try {
			String sql = "select DATE_FORMAT(a.data,'%d/%m/%Y') as data,a.horario,m.nomeMedico,e.nomeEspecialidade,case a.status when 'A' then 'Agendado' when 'C' then 'Cancelado' when 'F' then 'Finalizado' else '' end as status from tbagendamento a join tbmedico m on m.idMedico = a.medico join tbespecialidade e on m.idEspecialidade = e.idEspecialidade join tbpaciente p on p.idPaciente = a.paciente where p.cpf = ? order by a.data, a.horario";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, cpf);
			ResultSet rs = psmt.executeQuery();
			
			int con = 0;
			while (rs.next()) {
	            lista[con][0]=rs.getString("data");
	            lista[con][1]=rs.getString("horario");
	            lista[con][2]=rs.getString("nomeMedico");
	            lista[con][3]=rs.getString("nomeEspecialidade");
	            lista[con][4]=rs.getString("status");
	            con++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return lista;
	}	
	
}
