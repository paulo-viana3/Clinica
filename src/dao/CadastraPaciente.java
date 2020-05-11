package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import model.Paciente;

public class CadastraPaciente {

	public boolean novo(Paciente p)  {
		

			Connection conn = null;
			
			try {
				
				String sql = "insert into tbpaciente (nome,cpf,telContato,email,dataNasc,senha)" +
								"values (?,?,?,?,?,?)";
				

				conn = Conexao.getConexaoMySQL();
				
			/*	
				SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
				java.util.Date date = sdf1.parse(p.getDataNasc());
				java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
				*/
				
				PreparedStatement pstm = conn.prepareStatement(sql);

				
				pstm.setString(1, p.getNome());
				pstm.setString(2, p.getCpf());
				pstm.setString(3, p.getTelContato());
				pstm.setString(4, p.getEmail());
				pstm.setDate(5, p.getDataNasc());
				pstm.setString(6, p.getSenha());


				pstm.execute();

				return true;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				Conexao.FecharConexao();
			}
			return false;
		
			
		}


	}


