<%@page language="java" contentType="text/html" pageEncoding="UTF-8" 
import="dao.CadastraPaciente , model.Paciente , model.Agendamento, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/icone.png" type="image/icon">
<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />
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

<title>Dados Cadastrais</title>

</head>
<%
String res = null;

res = String.valueOf(request.getAttribute("resultado"));

if(res.equals("false")){

	out.print("<script>"); 
	out.print("alert('Falha ao atualizar');"); 
	out.print("</script>");

}else if(res.equals("true")){
	out.print("<script>"); 
	out.print("alert('Dados atualizados com sucesso');"); 
	out.print("</script>");

}else{
	
}
res = null;
%>
<body>


<input type="checkbox" id="bt_menu">
	<label for="bt_menu">&#9776;</label>

	<nav class="menu">
		<ul>
			<li><a href="home.jsp">Home</a>
			<li><a href="agendamento.jsp?id=0">Consulta</a>
			<!--<li><a href="dadosCadastrais.jsp">Dados Cadastrais</a>-->
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
  <div class="section-title">
        <h4>Dados Paciente</h4>
 </div>
<form name="contact_form" class="default-form contact-form" action="salvaConsulta" method="POST">
        <div class="row">

                <div class="form-group mb-2">
                    <input type="text" name="nome" value="" readonly=“true” placeholder="Nome">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="cpf" value="" readonly=“true” placeholder="CPF">
                </div>
               
                <div class="form-group mb-2">
                    <input oninput="mascaraData(this)" type="text" readonly=“true” name="data" value="" placeholder="Data de Nascimento">
                </div>
                
          </div>
           
           <div class="row">
				<div class="section-title">
				        <h4>Dados Consulta</h4>
				 </div>
                <div class="form-group mb-2">
                	<textarea name="diagnostico" rows="6" cols="64" placeholder="Diagnóstico"></textarea>
                </div>
                
                <div class="form-group mb-2">
                	<textarea name="prescricao" rows="6" cols="64" placeholder="Prescrição"></textarea>
                </div>
               
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
          
              
               <button type="submit" class="btn-style-one" onclick="validatePassword()">Salvar</button>
                            
            </div>
    </form>
   </center>
   </section>
</body>
</html>