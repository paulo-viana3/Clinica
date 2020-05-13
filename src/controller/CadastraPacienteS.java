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

import dao.CadastraPaciente;
import model.Paciente;

@WebServlet("/cadastra")
public class CadastraPacienteS extends HttpServlet {

	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException {
        
		Paciente p = new Paciente();
		CadastraPaciente cp = new CadastraPaciente();
		boolean cadastrou = false;
		
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String data = request.getParameter("data");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        String senha = request.getParameter("confirm_password");
        
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		java.sql.Date dataFormat = new java.sql.Date(format.parse(data).getTime());
		
        p.setNome(nome);
        p.setCpf(cpf);
        p.setDataNasc(dataFormat);
        p.setTelContato(telefone);
        p.setEmail(email);
        p.setSenha(senha);
  
        cadastrou = cp.novo(p);
        
        RequestDispatcher rd = null;
        request.setAttribute("resultado", cadastrou);
        rd = request.getRequestDispatcher("index.jsp");
       
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
			processarRequisicao(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
