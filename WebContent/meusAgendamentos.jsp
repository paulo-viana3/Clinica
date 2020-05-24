<%@page language="java"  contentType="text/html ; charset=UTF-8" 
pageEncoding="UTF-8"
import="dao.BuscaAgendamento , java.util.* , controller.CancelarConsultaS,model.Agendamento"
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
			<li><a href="agendamento.jsp?id=0">Agendamento Consulta</a>
			<li><a href="dadosCadastrais.jsp">Dados Cadastrais</a>
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
	<form action="cancelar" method="POST">
	<input type="hidden" name="idagenda" id="idagenda" value="">
	
	<table border=1>
		<tr>
			<th class="titulo-coluna">Data Consulta</th>
			<th class="titulo-coluna">Horário</th>
			<th class="titulo-coluna">Nome Médico</th>
			<th class="titulo-coluna">Nome Especialidade</th>
			<th class="titulo-coluna">Status</th>
			<th class="titulo-coluna">Cancelar</th>
		</tr>
	<%

		String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
		ArrayList<Agendamento> agenda = new ArrayList<Agendamento>();
		
		
		BuscaAgendamento bt = new BuscaAgendamento();
		
		agenda = bt.buscaAgendamento(cpf);
		
		String status = "Cancelado";		
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
		
	<% } %>

	</table>
	</form>
</center>
</section>

</body>
</html>