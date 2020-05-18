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
  
        String verificaCpf= cp.buscaPaciente(cpf);
        boolean cpfValido = valida_CPF(cpf.replace(".","").replace("-",""));
        
        if(verificaCpf != null ||  cpfValido == false) {
        	cadastrou = false;
        }else {
        	cadastrou = cp.novo(p);
        }

        RequestDispatcher rd = null;
        
        if(cadastrou) {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("cpf", cpf);
            sessao.setAttribute("senha", senha);
            
    		request.setAttribute("resultado", cadastrou);
    		rd = request.getRequestDispatcher("index.jsp");
		} else {
    		request.setAttribute("resultado", cadastrou);
    		rd = request.getRequestDispatcher("cadastra.jsp");
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
	
	public static boolean valida_CPF(String cpf) {
	    int i = 0;
	    int[] arrayCPF = new int[11];
	    int cpf1 = 0, cpf2 = 0;
	    for (i = 0; i < 11; i++) { //For que auxilia na transferencia de valores do CPF para Array
	        arrayCPF[i] = Integer.parseInt(cpf.charAt(i) + "");
	        if (i < 9) {
	            cpf1 += arrayCPF[i] * (10 - i);
	        }
	        if (i < 10) {
	            cpf2 += arrayCPF[i] * (11 - i);
	        }
	    }
	    cpf1 = (cpf1 * 10) % 11;

	    cpf2 = (cpf2 * 10) % 11;
	    if (cpf1 > 9) {
	        cpf1 = 0;
	    }
	    if (cpf2 > 9) {
	        cpf2 = 1;
	    }
	    if (cpf1 == arrayCPF[9] && cpf2 == arrayCPF[10]) {
	        return true;
	    } else {
	        return false;
	    }
	}
	
	
}
