<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</script>
<title>Dados Cadastrais</title>
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
			<li><a href="index.jsp">Sair</a>
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
                    <input type="text" name="nome" placeholder="Nome" required="">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="cpf" placeholder="CPF" required="">
                </div>
               
                <div class="form-group mb-2">
                    <input type="text" name="data" placeholder="Data de Nascimento" required="">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="telefone" placeholder="Telefone Celular" required="">
                </div>
                
                <div class="form-group mb-2">
                    <input type="text" name="email" placeholder="E-mail" required="">
                </div>
               
                <div class="form-group ">
                    <input type="password" name="password" placeholder="Senha" id="password" required="">
                </div>
                
                <div class="form-group">
                    <input type="password" name="confirm_password" placeholder="Confirmar Senha" id="confirm_password" required="">
                </div>
                <br>
                
           
          
            <div class="col-md-12 col-sm-12 col-xs-12">
          
                <div class="form-group text-center">
                    <button type="submit" class="btn-style-one" onclick="validatePassword()">Cadastrar</button>
                </div>
                <div class="form-group text-center">
                    <button type="reset" class="btn-style-one" onclick="limpar()">Limpar</button>
                </div>
            </div>
        </div>
    </form>
   </center>
   </section>
</body>
</html>