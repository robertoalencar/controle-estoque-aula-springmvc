<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Usuário</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">

	<br />
	
	<c:import url="/WEB-INF/view/comum/menu.jsp" />

	<hr>
	<h3>Incluir Usuário</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div> <br/>
	
	<form action="save" method="post">

		<div class="form-group">
			<label for="inputNome">Nome</label>
			<input type="text" id="inputNome" class="form-control" name="nome" style="width: 400px;" maxlength="100" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputEmail">E-mail</label>
			<input type="text" id="inputEmail" class="form-control" name="email" style="width: 400px;" maxlength="100" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputLogin">Login</label>
			<input type="text" id="inputLogin" class="form-control" name="login" style="width: 300px;" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputSenha">Senha</label>
			<input type="password" id="inputSenha" class="form-control" name="senha" style="width: 300px;" required="required" />
		</div>
		
		<br />
		
		<div class="form-group">
			<a href="<%=request.getContextPath()%>/usuario/list" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
			<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
			<button type="submit" class="btn btn-primary"> &nbsp; Inserir &nbsp; </button>
		</div>
		
	</form>

</body>
</html>
