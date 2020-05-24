<%@page language="java" contentType="text/html" pageEncoding="UTF-8" 
import="dao.CadastraPaciente , model.Paciente , java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/icone.png" type="image/icon">
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
        <h3>Dados Cadastrais</h3>
 </div>
 <br>
<form name="contact_form" class="default-form contact-form" action="atualiza" method="POST">
        <div class="row">

                <div class="form-group mb-2">
                    <input type="text" name="nome" value="<%=p.getNome()%>" placeholder="Nome">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="cpf" value="<%=p.getCpf()%>" readonly=“true” placeholder="Cpf">
                </div>
               
                <div class="form-group mb-2">
                    <input oninput="mascaraData(this)" type="text" name="data" value="<%=data%>" placeholder="Data de Nascimento">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="telefone" value="<%=p.getTelContato()%>" placeholder="Telefone Celular">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="email" value="<%=p.getEmail()%>" placeholder="E-mail">
                </div>
               
                <div class="form-group ">
                    <input type="password" name="password" value="<%=p.getSenha()%>" id="password"  placeholder="Senha" >
                </div>
                
                <div class="form-group">
                    <input type="password" name="confirm_password" value="<%=p.getSenha()%>" id="confirm_password"  placeholder="Confirmar Senha" >
                </div>
                <br>
                
           
            <div class="col-md-12 col-sm-12 col-xs-12">
          
              
               <button type="submit" class="btn-style-one" onclick="validatePassword()">Salvar</button>
                            
            </div>
        </div>
    </form>
   </center>
   </section>
</body>
</html>