<%@page language="java"  contentType="text/html ; charset=UTF-8" 
pageEncoding="UTF-8"
import="dao.BuscaAgendamento"
%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>


<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />

<title>Meus Agendamentos</title>
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
	
	<table border=1><tr><th>Num. Agendamento</th><th>Data Consulta</th><th>Horário</th><th>Nome Médico</th><th>Nome Especialidade</th><th>Status</th><th>Cancelar</th></tr>
	
	<%

		String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
		String [][] agenda = new String[10][7];
		BuscaAgendamento bt = new BuscaAgendamento();
		
		agenda = bt.buscaAgendamento(cpf);
		String status = "Cancelado";		
		for(int i=0;i<10;i++) {
			if(agenda[i][0] == null) {
				agenda[i][0] = "";
				agenda[i][1] = "";
				agenda[i][2] = "";
				agenda[i][3] = "";
				agenda[i][4] = "";
				agenda[i][5] = "";
			}
	%>
			    
        <form action="cancelar" method="POST">
            <input type="hidden" name="tarefa" value="CancelarAgendamento">
            <input type="hidden" name="id" value="<%=agenda[i][0]%>">
	            <tr>
	            	<td><%=agenda[i][0]%></td>
				    <td><%=agenda[i][1]%></td>
				    <td><%=agenda[i][2]%></td>
				    <td><%=agenda[i][3]%></td>
				    <td><%=agenda[i][4]%></td>
				    <td><%=agenda[i][5]%></td>  
			    
	<%
		if(agenda[i][0] == "" || status.equals(agenda[i][5])){
	%>
				<td></td>
	<%
		} else {
	%>
                <td><input type="submit" name="cancelar" value=<%=agenda[i][0] %>></td>
            
	<%
		}}

	%>
				</tr>
        </form>
	</table>
</center>
</section>

</body>
</html>