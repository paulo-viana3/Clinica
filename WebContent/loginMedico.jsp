<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <title>Clínica Médica</title>

  
  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
<title>Login</title>
<style>
*{
	margin: 0;
	padding: 0;
}

.menu{
	width: 100%;
	height: 57px;
	background-color: #48bdc5;
	font-family: "Roboto", sans-serif;
	font-size: 15px;
}

.menu ul{
	list-style:none;
	position: relative;
	background-color: #48bdc5;
}

.menu ul li{
	width: 120px;
	float: right;
}

.menu ul li:hover ul{
	visibility: visible;
}

.menu ul ul{
	position: absolute;
	visibility: hidden;
}

.menu ul ul li{
	float: none;
	border-bottom: solid 1px #fff;
}

.menu a {
	padding: 15px;
	display: block;
	text-decoration: none;
	text-align: center;
	background-color: #48bdc5;
	color: #fff;
}

.menu a:hover{
	background-color: #a6f0f5;
	color: #48bdc5;
	font-weight: bold;
}

label[for="bt_menu"]{
	padding: 5px;
	background-color: #48bdc5;
	color: #fff;
	font-family: "Roboto", sans-serif;
	text-align: center;
	font-size: 30px;
	cursor: pointer;
	width: 50px;
	height: 50px;
}
#bt_menu{
	display: none;
}

label[for="bt_menu"]{
	display: none;
}

@media(max-width: 800px){
	.menu{
		margin-top: 5px;
		margin-left: -100%;
		transition: all .4s;
	}
	
	label[for="bt_menu"]{
		display: block;
	}
	
	#bt_menu:checked ~ .menu{
		margin-left: 0;
	}
	
	.menu ul li{
		width: 100%;
		float: none;
	}
	
	.menu ul ul{
		position: static;
		overflow: hidden;
		max-height: 0;
		transition: all .4s;
	}
	
	.menu ul li:hover ul{
		height: auto;
		max-height: 200px;
	}
}

</style>
<link rel="icon" href="images/icone.png" type="image/icon">
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<body>

<%
String res = null;

res = String.valueOf(request.getAttribute("resultado"));

if(res.equals("false")){

	out.print("<script>"); 
	out.print("alert('Usuário ou Senha incorretos');"); 
	out.print("</script>");

}else if(res.equals("true")){
	out.print("<script>"); 
	out.print("alert('Usuário cadastrado com sucesso');"); 
	out.print("</script>");

}else{
	
}
res = null;
%>

<input type="checkbox" id="bt_menu">
	<label for="bt_menu">&#9776;</label>

	<nav class="menu">
		<ul>
			<li><a href="login.jsp">Perfil</a>
				<ul>
					<li><a href="loginMedico.jsp">Médico</a></li>
					<li><a href="index.jsp">Paciente</a></li>
				</ul>
		</ul>
	</nav>
<br>
<br>
<section class="form">
<center>
 <div class="section-title">
 	<br>
 	<br>
        <h3>Login</h3>
 </div>
 <br>
 	
<form name="contact_form" class="default-form contact-form" action="entrarMedico" method="POST">
		<div id="row">
                <div class="form-group">
                    <input autofocus type="text" name="crm" placeholder="CRM" required="" tabindex=1>
                </div>
                <br>
                <div class="form-group">
                    <input type="password" name="senha" placeholder="Senha" required="" tabindex=2>
                </div>
          		<br>
          		<br>
	            <div class="col-md-12 col-sm-12 col-xs-12">
	                <div class="form-group text-center">
	                    <button type="submit" class="btn-style-one" tabindex=3>Entrar</button>
	                </div>
	            </div>
        	</div>
       
    </form>
   </center>
   </section>
</body>
</html>