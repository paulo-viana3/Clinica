<%@page language="java" contentType="text/html" pageEncoding="UTF-8" 
import="dao.CadastraPaciente , model.Paciente , java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="estiloDados.css" media="screen" />
<script>
function limpar() {
	if(document.getElementById('contact_form').value!="") {
		document.getElementById('nome').value="";
		document.getElementById('cpf').value="";
		document.getElementById('data').value="";
		document.getElementById('telefone').value="";
		document.getElementById('email').value="";
		document.getElementById('password').value="";
		document.getElementById('confirm_password').value="";
	}
}


function validatePassword(){
var password = document.getElementById("password")
, confirm_password = document.getElementById("confirm_password");
if(password.value != confirm_password.value) {
  confirm_password.setCustomValidity("Senhas diferentes!");
} else {
  confirm_password.setCustomValidity('');
}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;


</script>
<title>Dados Cadastrais</title>

</head>
<body>
<%

	String cpf = String.valueOf(request.getSession().getAttribute("cpf"));
	String nome = "";
	String data = "";
	
	Paciente p = new Paciente();
	CadastraPaciente cp = new CadastraPaciente();
	
	if(cpf.equals("null")){
		response.sendRedirect("index.jsp");
	}
	else{
		p = cp.buscaPacienteCompleto(cpf);

		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		data = dateFormat.format(p.getDataNasc());
	}
%>

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
<form name="contact_form" class="default-form contact-form" action="cadastra" method="POST">
        <div class="row">

                <div class="form-group mb-2">
                    <input type="text" name="nome" placeholder="<%=p.getNome()%>">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="cpf" placeholder="<%=p.getCpf()%>" readonly=“true”>
                </div>
               
                <div class="form-group mb-2">
                    <input type="text" name="data" placeholder="<%=data%>" >
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="telefone" placeholder="<%=p.getTelContato()%>" >
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="email" placeholder="<%=p.getEmail()%>" >
                </div>
               
                <div class="form-group ">
                    <input type="password" name="password" placeholder="Senha" id="password" >
                </div>
                
                <div class="form-group">
                    <input type="password" name="confirm_password" placeholder="Confirmar Senha" id="confirm_password" >
                </div>
                <br>
                
           
          
            <div class="col-md-12 col-sm-12 col-xs-12">
          
              
               <button type="submit" class="btn-style-one" onclick="validatePassword()">Cadastrar</button>
              
               <button type="reset" class="btn-style-one" onclick="limpar()">Limpar</button>
              
            </div>
        </div>
    </form>
   </center>
   </section>
</body>
</html>