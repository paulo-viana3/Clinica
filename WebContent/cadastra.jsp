<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <title>Medic | Medical HTML Template</title>

  
  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<script>
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

</head>

<body>
<section class="header-uper">
      <div class="container clearfix">
            <div class="logo">
                  <figure>
                        <a href="index.html">
                              <img src="logo.png" alt="">
                        </a>
                  </figure>
            </div>
            <div class="right-side">
                  <ul class="contact-info">
                        <li class="item">
                              <strong>Email</strong>
                              <br>
                              <a href="#">
                                    <span>info@medic.com</span>
                              </a>
                        </li>
                        <li class="item">
                            
                              <strong>Contato</strong>
                              <br>
                              <span> (11) 2123 - 4567</span>
                        </li>
                  </ul>

            </div>
      </div>
</section>

<br>
<section class="form">
<center>
 <div class="section-title">
        <h3>Cadastro de Usuário</h3>
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
            </div>
        </div>
    </form>
   </center>
   </section>

</body>
</html>