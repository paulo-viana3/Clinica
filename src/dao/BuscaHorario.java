package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.Horario;
import model.Medico;

public class BuscaHorario {

	ArrayList<Horario> horario = new ArrayList<Horario>();
	
	public ArrayList<Horario> buscaHorario(int medico, String dia) throws ParseException {
		Horario h = new Horario();
		Connection conn = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date dataFormat = new java.sql.Date(format.parse(dia).getTime());
		//System.out.println(medico + "  param    "+dataFormat);
		try {
			String sql = "select hr.idHorario, hr.horario from tbhorario hr where horario NOT IN (select h.horario from tbhorario h inner join tbAgendamento a on a.horario = h.horario WHERE a.data = ? AND a.medico = ?)";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setDate(1, dataFormat);
			psmt.setInt(2, medico);
			
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				h.setIdHorario(rs.getInt("idHorario"));
				h.setHorario(rs.getString("horario"));
				horario.add(h);
				System.out.println(h.getHorario());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return horario;
	}
	
	public String buscaHora(int codigo) {
		Connection conn = null;
		String hora = "";
		try {
			String sql = "SELECT horario FROM tbhorario where idHorario = ?";
			conn = Conexao.getConexaoMySQL();
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, codigo);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				hora = rs.getString("horario");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conexao.FecharConexao();
		}
		return hora;
	}
	
	
}
