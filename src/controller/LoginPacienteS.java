package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginPaciente;
import model.Paciente;

@WebServlet("/login")
public class LoginPacienteS extends HttpServlet {
	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, ParseException, SQLException {

		String cpf = request.getParameter("cpf");
		String senha = request.getParameter("senha");
		
		Paciente p = new Paciente();
		LoginPaciente loginBD = new LoginPaciente();
		boolean entrou = false;

		p.setCpf(cpf);
		p.setSenha(senha);

		entrou = loginBD.login(p);
		RequestDispatcher rd = null;
		
		if(cpf != null && senha != null) {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("cpf", cpf);
            sessao.setAttribute("senha", senha);
            
    		request.setAttribute("resultado", entrou);
    		rd = request.getRequestDispatcher("pagina2.jsp");
		} else {
    		request.setAttribute("resultado", entrou);
    		rd = request.getRequestDispatcher("pagina2.jsp");
		}

		try {
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processarRequisicao(request, response);
		} catch (ParseException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processarRequisicao(request, response);
		} catch (ParseException | SQLException e) {
			e.printStackTrace();
		}
	}
}