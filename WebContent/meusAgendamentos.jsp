<%@page language="java"  contentType="text/html ; charset=UTF-8" 
pageEncoding="UTF-8"
import="dao.BuscaAgendamento , java.util.* , java.text.*, controller.CancelarConsultaS,model.Agendamento, dao.LoginMedico"
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/icone.png" type="image/icon">
<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />
<title>Meus Agendamentos</title>
<style>
.button-finalizar{
  font-weight: bold;
  font-size: 15px;
  color: #ffffff;
  line-height: 27px;
  padding: 6px 20px;
  position: relative;
  background: #48bdc5;
  border: 1px solid #48bdc5;
  display: inline-block;
  text-transform: uppercase;
  font-family: "Roboto", sans-serif;
  transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -webkit-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  border-radius: 5px;
}
.button-finalizar:hover{
  font-weight: bold;
  color: #48bdc5;
  border: 1px solid #48bdc5;
  background: #ffffff;
  transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -webkit-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  border-radius: 5px;
}
</style>
<script>
function selectId(id){
	
	document.getElementById('idagenda').value = id;

}
</script>
</head>
<body>
<script>
function pegarData(param,nome1){
	
	 var d = document.getElementById("data");//get the combobox
	 var selGate = d.value;
	
	 document.getElementById('datasel').value = selGate;
	 
	 location.href=param+"?"+nome1+"="+selGate;
	  
}

</script>
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
String data = request.getParameter("id");


if(data == null){
	Date data2 = new Date(System.currentTimeMillis());
	SimpleDateFormat formatarDate = new SimpleDateFormat("yyyy-MM-dd");
	
    data = formatarDate.format(data2);
	
}

res = String.valueOf(request.getAttribute("resultado"));

if(res.equals("false")){

	out.print("<script>"); 
	out.print("alert('Falha ao finalizar consulta');"); 
	out.print("</script>");

}else if(res.equals("true")){
	out.print("<script>"); 
	out.print("alert('Consulta cancelada com sucesso');"); 
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
	<form name="proc" id="proc" method="POST" action="procedure">
	
	<% 	if(cpf != "null"){	
	%>
		<input type="submit" value="Apagar Registros Antigos" name="botao">
	<%} %>
		
	</form>
	
	<br>
	<br>
	<div class="form-group">
	<% if(cpf.equals("null")){
	%>
		<input type="date" name="data" id="data" value="<%=data%>" onchange="pegarData('meusAgendamentos.jsp','id')">
	<% } %>
	<input type="hidden" name="datasel" id="datasel" value="">
	</div>
	
	<form action="<%=action%>" method="POST">
	<input type="hidden" name="idagenda" id="idagenda" value="">
	
	<table border=1>
		
		<tr>
		<%
			BuscaAgendamento bt = new BuscaAgendamento();
			ArrayList<Agendamento> agenda = new ArrayList<Agendamento>();
			int total = 0;
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
				agenda = bt.buscaAgendamentoM(crm, data);
				total = bt.buscaTotalAgendamento(crm, data);
		%>
			<th class="titulo-coluna">Data Consulta</th>
			<th class="titulo-coluna">Horário</th>
			<th class="titulo-coluna">Nome Paciente</th>
			<th class="titulo-coluna">Ir Para</th>
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
				<% if(agenda.get(i).getStatus().equals("Cancelado") || agenda.get(i).getStatus().equals("Finalizado")){ %>
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
					<td><center><input type="submit" class="button-finalizar" name="finalizar" value="Consulta" onclick="selectId('<%=agenda.get(i).getIdAgendamento()%>')"></center></td>
			</tr>
			
		<% }}
		%>

	</table>
	<%
	if(crm != "null"){	
	%>
		<h1><%=total%> Registros Encontrados</h1>
	<%} %>
	</form>
</center>
</section>

</body>
</html>