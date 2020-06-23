package controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CadastraPaciente;
import dao.CancelarConsulta;
import dao.ExecutaProcedure;
import model.Paciente;

@WebServlet("/procedure")
public class ChamaProcedure extends HttpServlet {

private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException {
        
		String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
		CadastraPaciente cp = new CadastraPaciente();
		ExecutaProcedure exec = new ExecutaProcedure();
		
		Paciente p = new Paciente();
		
		p = cp.buscaPaciente(cpf);
		
		exec.execProc(p.getIdPaciente());
		
        RequestDispatcher rd = null;
        

    	rd = request.getRequestDispatcher("meusAgendamentos.jsp");
		
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
