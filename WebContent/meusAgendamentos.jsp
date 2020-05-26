<%@page language="java"  contentType="text/html ; charset=UTF-8" 
pageEncoding="UTF-8"
import="dao.BuscaAgendamento , java.util.* , controller.CancelarConsultaS,model.Agendamento, dao.LoginMedico"
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/icone.png" type="image/icon">
<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />
<title>Meus Agendamentos</title>
<script>
function selectId(id){
	
	document.getElementById('idagenda').value = id;

}
</script>
</head>
<body>
<%
	String crm = String.valueOf(request.getSession().getAttribute("crm"));
	String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
	String action = "";
	
	if(cpf.equals("null")){
		action = "consulta.jsp"; 
	}
	if(crm.equals("null")){
		action = "cancelar"; 
	}
	
%>

<%
String res = null;

res = String.valueOf(request.getAttribute("resultado"));

if(res.equals("false")){

	out.print("<script>"); 
	out.print("alert('Cancelamento Indisponível');"); 
	out.print("</script>");

}else if(res.equals("true")){
	out.print("<script>"); 
	out.print("alert('Cancelado com sucesso');"); 
	out.print("</script>");

}else{
	
}
res = null;
%>

<input type="checkbox" id="bt_menu">
	<label for="bt_menu">&#9776;</label>

	<nav class="menu">
		<ul>
			<li><a href="home.jsp">Home</a>
			<%
				if(cpf != "null"){
					
			%>
			<li><a href="agendamento.jsp?id=0">Agendamento Consulta</a>
			<li><a href="dadosCadastrais.jsp">Dados Cadastrais</a>
			<% }%>
			<li><a href="meusAgendamentos.jsp">Meus Agendamentos</a>
			<li><a href="sair">Sair</a>
		</ul>
	</nav>
	<br>
	<br>
	<br>
<section class="form">
<center>
	<div class="section-title">
	       <h3>Meus Agendamentos</h3>
	</div>
	<br>
	<br>
	<form action="<%=action%>" method="POST">
	<input type="hidden" name="idagenda" id="idagenda" value="">
	
	<table border=1>
		
		<tr>
		<%
			BuscaAgendamento bt = new BuscaAgendamento();
			ArrayList<Agendamento> agenda = new ArrayList<Agendamento>();
			if(cpf != "null"){
					
				agenda = bt.buscaAgendamento(cpf);
				
				String status = "Cancelado";		
				
		%>
			<th class="titulo-coluna">Data Consulta</th>
			<th class="titulo-coluna">Horário</th>
			<th class="titulo-coluna">Nome Médico</th>
			<th class="titulo-coluna">Nome Especialidade</th>
			<th class="titulo-coluna">Status</th>
			<th class="titulo-coluna">Cancelar</th>
		<%} %>
		<%
			if(crm != "null"){
				agenda = bt.buscaAgendamentoM(crm);
		%>
			<th class="titulo-coluna">Data Consulta</th>
			<th class="titulo-coluna">Horário</th>
			<th class="titulo-coluna">Nome Paciente</th>
			<th class="titulo-coluna">Informações</th>
		<%} %>
		</tr>
	<%
	if(cpf != "null"){
		for(int i=0;i<agenda.size();i++) {
		
	%>
		 

		<tr>
	            <td><%=agenda.get(i).getDataformatada()%></td>
				<td><%=agenda.get(i).getHorario()%></td>
				<td><%=agenda.get(i).getNomeMedico()%></td>
				<td><%=agenda.get(i).getEspecialidade()%></td>
				<td><%=agenda.get(i).getStatus()%></td>
				<% if(agenda.get(i).getStatus().equals("Cancelado")){ %>
					<td></td>
				<% } else { %>
					<td><center><input type="submit" class="button-cancelar" name="cancelar" value="X" onclick="selectId('<%=agenda.get(i).getIdAgendamento()%>')"></center></td>
				<% } %>
		</tr>
		
	<% }}
		if(crm != "null"){
			for(int i=0;i<agenda.size();i++) {
			
		%>

			<tr>
		            <td><%=agenda.get(i).getDataformatada()%></td>
					<td><%=agenda.get(i).getHorario()%></td>
					<td><%=agenda.get(i).getNomePaciente()%></td>
					<td><center><input type="submit" class="button-cancelar" name="cancelar" value="Aprovar" onclick="selectId('<%=agenda.get(i).getIdAgendamento()%>')"></center></td>
			</tr>
			
		<% }}
		%>

	</table>
	</form>
</center>
</section>

</body>
</html>