package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.Medico;

public class BuscaHorario {

	ArrayList<String> horario = new ArrayList<String>();

	public ArrayList<String> buscaHorario(int medico, String dia) throws ParseException {
		Connection conn = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date dataFormat = new java.sql.Date(format.parse(dia).getTime());
		//System.out.println(medico + "  param    "+dataFormat);
		try {
			String sql = "select horario  from tbhorario where horario NOT IN (select h.horario from tbhorario h inner join tbAgendamento a on a.horario = h.horario WHERE a.data = ? AND a.medico = ?)";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setDate(1, dataFormat);
			psmt.setInt(2, medico);
			
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				
				horario.add(rs.getString("horario"));
	
			}
			//System.out.println(horario.size());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return horario;
	}
}
