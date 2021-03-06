<%@page language="java"  contentType="text/html ; charset=UTF-8" 
pageEncoding="UTF-8" 
import="dao.CadastraPaciente , dao.BuscaAgendamento, model.Paciente , model.Medico, dao.BuscaHorario, dao.BuscaEspecialidade, dao.BuscaMedico, model.Horario, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>

<script>

function selectData(param, nomeDoCampo){
	
	 var e = document.getElementById("especialidade");//get the combobox
	 var selGate = e.options[e.selectedIndex].value;

	 
	 location.href=param+"?"+nomeDoCampo+"="+selGate;
	
}

function pegarData(param, nome1,nome2,nome3){
	
	 var d = document.getElementById("data");//get the combobox
	 var selGate = d.value;
	
	 var e = document.getElementById("profissional");//get the combobox
	 var selecionado = e.options[e.selectedIndex].value;
	 
	 var esp = document.getElementById("especialidade");//get the combobox
	 var selec = esp.options[esp.selectedIndex].value;
	 
	 location.href=param+"?"+nome1+"="+selec+"&"+nome2+"="+selGate+"&"+nome3+"="+selecionado;
	  
}

</script>

<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />
<link rel="icon" href="images/icone.png" type="image/icon">
<title>Agendamento Consulta</title>
</head>
<body>
<%
Date data2 = new Date(System.currentTimeMillis());
SimpleDateFormat formatarDate = new SimpleDateFormat("yyyy-MM-dd");

String res = null;

res = String.valueOf(request.getAttribute("resultado"));

if(res.equals("false")){

	out.print("<script>"); 
	out.print("alert('Agendamento Indisponível');"); 
	out.print("</script>");

}else if(res.equals("true")){
	out.print("<script>"); 
	out.print("alert('Agendado com sucesso');"); 
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
        <h3>Agendamento</h3>
 </div>
 <br>
<form name="formagenda" class="default-form contact-form" action="agendar" method="POST">
        <div class="row">
				<div class="form-group">
                	<select name="especialidade" id="especialidade" class="form-group" onchange="selectData('agendamento.jsp','id')">   
                		<option value="" disabled selected>Especialidade</option>
				 <%
                	  
                	  	ArrayList<String> esp = new ArrayList<String>();
						BuscaEspecialidade be = new BuscaEspecialidade();
						esp = be.buscaEspecialidade();
						String espAtual = "";
						for(int i=0;i<esp.size();i++){
							
							espAtual = esp.get(i);	
							String id = request.getParameter("id");
							
							 if(Integer.parseInt(id) == i+1){
               				 %>
					  			<option value="<%=i+1%>" selected = "selected"> <%=espAtual%> </option>
					  		<%}else {
							 %>
					 			<option value="<%=i+1%>"> <%=espAtual%> </option>
					 		 
					  		<% } %>
					  		  
								
							<% 
								
							}
						
						%>
                	</select>
                </div>
                
                <div class="form-group">
                	<select name="profissional" id="profissional" class="form-group" >   
                		<option value="" disabled selected>Médico</option>
				  <%
                	  
                	  	ArrayList<Medico> med = new ArrayList<Medico>();
						BuscaMedico bm = new BuscaMedico();
						
						String medico = request.getParameter("id");
						
						if(medico != null){
							med = bm.buscaMedico(Integer.parseInt(request.getParameter("id")));
							String medAtual = "";
							int codigo;
							int i;
							for(i=0;i<med.size();i++){
								
								medAtual = med.get(i).getNome();	
								codigo = med.get(i).getId();
							
							  if(Integer.parseInt(medico) == med.get(i).getId()){
               	 		%>
               	 				<option value="<%=codigo%>" selected="selected"> <%=medAtual%> </option>

                	<%	} else { %>
                				<option value="<%=codigo%>"> <%=medAtual%> </option>
                	
                	<% }}} %>
                	
                	</select>
                </div>
                <div class="form-group">
                	<%
                		String data1 = request.getParameter("data");
                		if (data1 == null) {
                	%>
                    <input type="date" name="data" id="data" min="<%=formatarDate.format(data2)%>" onchange="pegarData('agendamento.jsp','id','data','medico')">
                    <%	} else { %>
                    <input type="date" name="data" id="data" value="<%=data1%>" onchange="pegarData('agendamento.jsp','id','data','medico')">
                    <% } %>
                </div>
               
                <div class="form-group">
                    <select name="horario" id="horario" class="form-group" >   
                		<option value="" disabled selected>Horário</option>
				  <%
                	  
                	  	ArrayList<Horario> hor = new ArrayList<Horario>();
				  		BuscaHorario bh = new BuscaHorario();
				  		
						String data = request.getParameter("data");
						String medic = request.getParameter("medico");
						
						if(data != null && medic != null){
							hor = bh.buscaHorario(Integer.parseInt(medic), data);
							//System.out.println("primeiro: "+hor.get(0).getHorario());
							String horAtual = "";
							int cod = 0;
							int i;
							for(i=0;i<hor.size();i++){
								cod = hor.get(i).getIdHorario();
								horAtual = hor.get(i).getHorario();
								
								System.out.println(i);
               	 		%>
               	 		<option value="<%=cod%>"> <%=horAtual%> </option>

                	<% }} %>
                	</select>
                </div>
                
          	<br> 
          	<br>
            <div class="col-md-12 col-sm-12 col-xs-12">
          
              
               <button type="submit" class="btn-style-one" onclick="">Agendar</button>
            </div>
        </div>
    </form>
   </center>
</section>
</body>
</html>