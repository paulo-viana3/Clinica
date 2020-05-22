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
import model.Agendamento;
import model.Horario;

@WebServlet("/agendar")
public class AgendarConsultaS extends HttpServlet {

	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException {
        
		Agendamento a = new Agendamento();
		AgendarConsulta ac = new AgendarConsulta();
		CadastraPaciente cp = new CadastraPaciente();
		BuscaHorario bh = new BuscaHorario();
		
		boolean cadastrou = false;
		String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
		
		String data = request.getParameter("data");
		String medico = request.getParameter("profissional");
        String horario = request.getParameter("horario");
        
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date dataFormat = new java.sql.Date(format.parse(data).getTime());
		
		int codPaciente = cp.buscaPaciente(cpf).getIdPaciente();
		String hora = bh.buscaHora(Integer.parseInt(horario));
		
		a.setData(dataFormat);
		a.setIdMedico(Integer.parseInt(medico));
		a.setIdPaciente(codPaciente);
		a.setStatus("A");
		a.setHorario(hora);
		a.setDiagnostico("");
		a.setPrescricao("");
  
        cadastrou = ac.novo(a);

        RequestDispatcher rd = null;
        
        if(cadastrou) {
    		request.setAttribute("resultado", cadastrou);
    		rd = request.getRequestDispatcher("agendamento.jsp?id=0");
		} else {
    		request.setAttribute("resultado", cadastrou);
    		rd = request.getRequestDispatcher("agendamento.jsp?id=0");
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