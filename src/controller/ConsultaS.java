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

import dao.BuscaAgendamento;
import model.Agendamento;
import model.Paciente;

@WebServlet("/salvaConsulta")
public class ConsultaS extends HttpServlet {

	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException {
        
		Paciente p = new Paciente();
		Agendamento a = new Agendamento();
		BuscaAgendamento ba = new BuscaAgendamento();
		boolean consulta = false;
		
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String data = request.getParameter("data");
        String diagnostico = request.getParameter("diagnostico");
        String prescricao = request.getParameter("prescricao");
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		java.sql.Date dataFormat = new java.sql.Date(format.parse(data).getTime());
		
        p.setNome(nome);
        p.setCpf(cpf);
        p.setDataNasc(dataFormat);
        a.setDiagnostico(diagnostico);
        a.setPrescricao(prescricao);
        
        consulta = true;

        RequestDispatcher rd = null;
        
            HttpSession sessao = request.getSession();
            sessao.setAttribute("cpf", cpf);
            //sessao.setAttribute("senha", senha);
            
    		request.setAttribute("resultado", consulta);
    		rd = request.getRequestDispatcher("consulta.jsp");
       
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