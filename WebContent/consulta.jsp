<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
	import="dao.CadastraPaciente , model.Paciente , model.Agendamento, dao.BuscaAgendamento, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/icone.png" type="image/icon">
<link rel="stylesheet" type="text/css" href="estiloDados.css"
	media="screen" />
<script>

function mascaraData(i){
	   
	   var v = i.value;
	   
	   if(isNaN(v[v.length-1])){ // impede entrar outro caractere que não seja número
	      i.value = v.substring(0, v.length-1);
	      return;
	   }
	   
	   i.setAttribute("maxlength", "10");
	   if (v.length == 2 || v.length == 5) i.value += "/";

}


</script>

<title>Consulta</title>

</head>
<%
String res = null;

res = String.valueOf(request.getAttribute("resultado"));

if(res.equals("false")){

	out.print("<script>"); 
	out.print("alert('Falha ao finalizar consulta');"); 
	out.print("</script>");

}else if(res.equals("true")){
	out.print("<script>"); 
	out.print("alert('Consulta finalizada com sucesso');"); 
	out.print("</script>");

}else{
	
}
res = null;
%>

<%
	String idAgenda = String.valueOf(request.getParameter("idagenda"));

	Paciente p = new Paciente();

	BuscaAgendamento ba = new BuscaAgendamento();
	
	p = ba.buscaPaciente(Integer.parseInt(idAgenda));
%>
<body>


	<input type="checkbox" id="bt_menu">
	<label for="bt_menu">&#9776;</label>

	<nav class="menu">
		<ul>
			<li><a href="home.jsp">Home</a>
			<li><a href="meusAgendamentos.jsp">Meus Agendamentos</a>
			<li><a href="sair">Sair</a>
		</ul>
	</nav>
	<br>
	<br>
	<section class="hero">
		<center>
			<div class="section-title">
				<h3>Consulta</h3>
			</div>
	</section>
	<section class="form">
		<center>
			<br>

			<form name="contact_form" class="default-form contact-form"
				action="finalizaConsulta" method="POST">
				<div class="row">
					<input type="hidden" name="idagenda" id="idagenda"
						value="<%=idAgenda%>">
					<div class="section-title">
						<h4>Dados Paciente</h4>
					</div>
					<div class="form-group mb-2">
						<input type="text" name="nome" value="<%=p.getNome()%>"
							readonly=“true” placeholder="Nome">
					</div>

					<div class="form-group mb-2">
						<input type="text" name="cpf" value="<%=p.getCpf()%>"
							readonly=“true” placeholder="CPF">
					</div>

					<div class="form-group mb-2">
						<input oninput="mascaraData(this)" type="text" readonly=“true”
							name="data" value="<%=p.getDataFormatada()%>"
							placeholder="Data de Nascimento">
					</div>

				</div>
				<br> <br>
				<div class="row">
					<div class="section-title">
						<h4>Dados Consulta</h4>
					</div>
					<div class="form-group mb-2">
						<textarea name="diagnostico" rows="6" cols="64"
							placeholder="Diagnóstico"></textarea>
					</div>

					<div class="form-group mb-2">
						<textarea name="prescricao" rows="6" cols="64"
							placeholder="Prescrição"></textarea>
					</div>

				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<br>
					<button type="submit" class="btn-style-one">Finalizar</button>

				</div>
			</form>
		</center>
	</section>
</body>
</html>