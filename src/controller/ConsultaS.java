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

import dao.AgendarConsulta;
import model.Agendamento;
import model.Paciente;

@WebServlet("/finalizaConsulta")
public class ConsultaS extends HttpServlet {

	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException {
        
		Agendamento a = new Agendamento();
		AgendarConsulta ac = new AgendarConsulta();
		boolean consulta = false;
		
        String diagnostico = request.getParameter("diagnostico");
        String prescricao = request.getParameter("prescricao");
        String idAgenda = String.valueOf(request.getParameter("idagenda"));
        
        a.setDiagnostico(diagnostico);
        a.setPrescricao(prescricao);
        a.setIdAgendamento(Integer.parseInt(idAgenda));
        
        consulta = ac.finalizaConsulta(a) != null;
        
    	request.setAttribute("resultado", consulta);
    	RequestDispatcher rd = request.getRequestDispatcher("meusAgendamentos.jsp");
    		
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