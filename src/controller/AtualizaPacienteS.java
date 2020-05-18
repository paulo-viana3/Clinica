package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.AtualizaPaciente;
import model.Paciente;

@WebServlet("/atualiza")
public class AtualizaPacienteS extends HttpServlet {
	
	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException {
        
		Paciente p = new Paciente();
		AtualizaPaciente ap = new AtualizaPaciente();
		boolean atualizou = false;
		
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String data = request.getParameter("data");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        String senha = request.getParameter("confirm_password");
        
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		java.sql.Date dataFormat = new java.sql.Date(format.parse(data).getTime());
		
		if(senha != ("null")) {
			p.setNome(nome);
	        p.setCpf(cpf);
	        p.setDataNasc(dataFormat);
	        p.setTelContato(telefone);
	        p.setEmail(email);
	        p.setSenha(senha);
		}else {
			p.setNome(nome);
			p.setCpf(cpf);
			p.setDataNasc(dataFormat);
			p.setTelContato(telefone);
			p.setEmail(email);
			String senhaAtualizada = String.valueOf(ap.retornSenha(cpf));
			p.setSenha(senhaAtualizada);
		}
  
        atualizou = ap.atualizaPaciente(p) != null;
        
        request.setAttribute("resultado", atualizou);
        RequestDispatcher rd = request.getRequestDispatcher("dadosCadastrais.jsp");
       
        try {
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
			processarRequisicao(request, response);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
			processarRequisicao(request, response);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
}
