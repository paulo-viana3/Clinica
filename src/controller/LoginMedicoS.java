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

import dao.LoginMedico;
import model.Medico;

@WebServlet("/entrarMedico")
public class LoginMedicoS extends HttpServlet {
	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, ParseException, SQLException {

		String crm = request.getParameter("crm");
		String senha = request.getParameter("senha");
		System.out.println(crm);
		System.out.println(senha);
		
		Medico m = new Medico();
		LoginMedico loginBD = new LoginMedico();
		boolean entrou = false;

		m.setCrm(crm);
		m.setSenha(senha);

		entrou = loginBD.login(m);
		RequestDispatcher rd = null;
		
		if(entrou) {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("crm", crm);
            sessao.setAttribute("senha", senha);
            
    		request.setAttribute("resultado", entrou);
    		rd = request.getRequestDispatcher("home.jsp");
		} else {
    		request.setAttribute("resultado", entrou);
    		rd = request.getRequestDispatcher("loginMedico.jsp");
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