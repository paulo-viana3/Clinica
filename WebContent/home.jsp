<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="dao.CadastraPaciente"%>
<!DOCTYPE html>
<html>
<head>
<%
	String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
	String nome = "";
	if(cpf.equals("null")){
		response.sendRedirect("index.jsp");
	}else{
		CadastraPaciente cp = new CadastraPaciente();
		nome = cp.buscaPaciente(cpf);
	}
%>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="homeStyle.css" media="screen" />
</head>

<body>

<input type="checkbox" id="bt_menu">
	<label for="bt_menu">&#9776;</label>

	<nav class="menu">
		<ul>
			<li><a href="home.jsp">Home</a>
			<li><a href="agendamento.jsp">Agendamento Consulta</a>
			<li><a href="dadosCadastrais.jsp">Dados Cadastrais</a>
			<li><a href="meusAgendamentos.jsp">Meus Agendamentos</a>
			<li><a href="sair">Sair</a>
		</ul>
	</nav>
	<div id="fundo-externo">
    	<div id="fundo">
				<div class="input-group mb-3">
					<h1>Bem Vindo, <%=nome%></h1>
				</div>
        	<img src="images/medicos.jpg" alt="" />
    	</div>
	</div>



</body>
</html>