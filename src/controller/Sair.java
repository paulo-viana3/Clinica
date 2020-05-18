package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sair")
public class Sair extends HttpServlet {

	private static final long serialVersionUID = 1L;
	 
    public Sair() {
        super();
    }
 
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
 
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	 request.getSession().invalidate();
         response.sendRedirect("index.jsp");
    }
}