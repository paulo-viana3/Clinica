<%@page language="java" contentType="text/html" pageEncoding="UTF-8" 
import="dao.CadastraPaciente , model.Paciente , java.text.*"%>
<!DOCTYPE html>
<html>
<head>
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
        <h3>Dados Cadastrais</h3>
 </div>
 <br>
<form name="contact_form" class="default-form contact-form" action="agenda" method="POST">
        <div class="row">

                <div class="form-group mb-2">
                    <input type="text" name="especialidade" placeholder="Especialidade">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="profissional" placeholder="Profissional" readonly=“true”>
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