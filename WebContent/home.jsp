<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="estilo.css" media="screen" />
</head>
<body>

<%
String usuario = String.valueOf(request.getAttribute("resultado"));

%>
<div class="input-group mb-3">
<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" value="<%=usuario%>">
</div>


</body>
</html>