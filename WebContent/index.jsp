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
.hidden{
	display: none;
}

.perfil{
  font-size: 14px;
  font-weight: 600;
  color: #fff;
  line-height: 27px;
  padding: 8px 26px;
  background: #48bdc5;
  border: 1px solid #48bdc5;
  display: inline-block;
  text-transform: uppercase;
  font-family: "Source Sans Pro", sans-serif;
  transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -webkit-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  border-radius: 5px;
}

.perfil:hover {
  color: #000;
  border: 1px solid #000;
  background: #ffffff;
  transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -webkit-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
}
</style>
<link rel="icon" href="images/icone.png" type="image/icon">
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />

<script>
function mascara(i){
	   
	   var v = i.value;
	   
	   if(isNaN(v[v.length-1])){ // impede entrar outro caractere que não seja número
	      i.value = v.substring(0, v.length-1);
	      return;
	   }
	   
	   i.setAttribute("maxlength", "14");
	   if (v.length == 3 || v.length == 7) i.value += ".";
	   if (v.length == 11) i.value += "-";
}
  
</script>

<script>
function mostra(id){
	if(id == "medico"){
		if(document.getElementById(id).style.display == 'block'){
			document.getElementById(id).style.display = 'none';
		} else{
			document.getElementById(id).style.display = 'block';
			document.getElementById("paciente").style.display = 'none';
		}
	} else if(id == "paciente"){
		if(document.getElementById(id).style.display == 'block'){
			document.getElementById(id).style.display = 'none';
		} else{
			document.getElementById(id).style.display = 'block';
			document.getElementById("medico").style.display = 'none';
		}
	}
}
</script>

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

<section class="header-uper">
      <div class="container clearfix">
            <div class="logo">
                  <figure>
                        <a href="index.jsp">
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
 	<br>
 	<br>
        <h3>Login</h3>
 </div>
 <br>
 	
    <table>
	<tr>
			<td colspan="2">
				<input type="button" class="perfil" value="Paciente" onClick="mostra('paciente')"/>
				<input type="button" class="perfil" value="Medico" onClick="mostra('medico')"/>
			</td>
		</tr>
	</table>
	<br>
<form name="contact_form" class="default-form contact-form" action="entrar" method="POST">
			<div id="paciente">
                <div class="form-group">
                    <input oninput="mascara(this)" autofocus type="text" name="cpf" placeholder="CPF" required="" tabindex=1>
                </div>
                <br>
                <div class="form-group">
                    <input type="password" name="senha" placeholder="Senha" required="" tabindex=2>
                </div>
          		<br>
          		 <div class="section-title">
          			<a href='cadastra.jsp'>Não possui cadastro? Clique aqui.</a>
          		</div>
          		<br>
	            <div class="col-md-12 col-sm-12 col-xs-12">
	                <div class="form-group text-center">
	                    <button type="submit" class="btn-style-one" tabindex=3>Entrar</button>
	                </div>
	            </div>
        	</div>
        <div id="medico" class="hidden" >
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