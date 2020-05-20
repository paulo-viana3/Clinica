<%@page language="java"  contentType="text/html" pageEncoding="UTF-8" 
import="dao.CadastraPaciente , model.Paciente , dao.BuscaEspecialidade, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<script>
function atualizaEsp(){
	

            // Selecionamos o menu dropdown, que possui os valores possíveis:
            var menu_dropdown = document.getElementById("especialidade");
            var medico = document.getElementById("profissional");
            // Requisitamos que a função handler (que copia o valor selecionado para a caixa de texto) [...]
            // [...] seja executada cada vez que o valor do menu dropdown mude:
            menu_dropdown.addEventListener("change", function(){

                // Como este código é executado após cada alteração, sempre obtemos o valor atualizado:
                var valor_selecionado = menu_dropdown.options[menu_dropdown.selectedIndex].value;
                
                
                
            });
           
}    


</script>
<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />
<title>Agendamento Consulta</title>
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
	<br>
	<br>
	<br>
	
<section class="form">
<center>
 <div class="section-title">
        <h3>Agendamento</h3>
 </div>
 <br>
<form name="contact_form" class="default-form contact-form" action="agenda" method="POST">
        <div class="row">
				<div class="form-group mb-2">
                	<select name="especialidade" id="especialidade" class="form-group" onchange="atualizaEsp()">   
                		<option value="0"> </option>
				 <%
                	  
                	  	ArrayList<String> esp = new ArrayList<String>();
						BuscaEspecialidade be = new BuscaEspecialidade();
						esp = be.buscaEspecialidade();
						
						String espAtual = "";
						for(int i=0;i<esp.size();i++){
							
							espAtual = esp.get(i);		
               	 %>
        
                
					  <option value="<%=i+1%>"> <%=espAtual%> </option>

                	<% } %>
                	</select>
                </div>
                <input type="hidden" name="idesp" id="idesp">
                
                <div class="form-group mb-2">
                	<select name="profissional" id="profissional" class="form-group">   
                </div>
               
                <div class="form-group mb-2">
                    <input type="text" name="Data" placeholder="Data Consulta" readonly=“true”>
                </div> 
                
                <div class="form-group mb-2">
                    <input type="text" name="horario" placeholder="Horário" >
                </div>
                
          	<br> 
          	<br>
            <div class="col-md-12 col-sm-12 col-xs-12">
          
              
               <button type="submit" class="btn-style-one" onclick="">Agendar</button>
              
               <button type="reset" class="btn-style-one" onclick="">Limpar</button>
              
            </div>
        </div>
    </form>
   </center>
</section>
</body>
</html>