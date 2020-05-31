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
import dao.BuscaHorario;
import dao.BuscaMedico;
import dao.CadastraPaciente;
import dao.CancelarConsulta;
import model.Agendamento;
import model.Horario;

@WebServlet("/cancelar")
public class CancelarConsultaS extends HttpServlet {

	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException {
        
		CancelarConsulta cc = new CancelarConsulta();
		boolean cancelou = false;
		String idAgendamento = request.getParameter("idagenda");
		int id = Integer.parseInt(idAgendamento);

		cancelou = cc.cancela(id);

        RequestDispatcher rd = null;
        
        if(cancelou) {
    		request.setAttribute("resultado", cancelou);
    		rd = request.getRequestDispatcher("meusAgendamentos.jsp");
		} else {
    		request.setAttribute("resultado", cancelou);
    		rd = request.getRequestDispatcher("meusAgendamentos.jsp");
		}
        
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