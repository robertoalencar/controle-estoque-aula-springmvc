<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema de Controle de Estoque</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">

	<br />
	<c:import url="/WEB-INF/view/comum/menu.jsp" />

	<hr> 
	<h3>Filtro Usuários</h3>
	<hr>
	
	<div>
		<form action="filter">
			<div class="form-group">
				<label for="inputNome">Nome</label>
				<input type="text" id="inputNome" class="form-control" name="nome" style="width: 500px;" />
			</div>
			<div class="form-group">
				<label for="inputEmail">E-mail</label>
				<input type="text" id="inputEmail" class="form-control" name="email" style="width: 500px;" />
			</div>
			<div class="form-group">
				<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
				<button type="submit" class="btn btn-primary"> &nbsp; Filtrar &nbsp; </button>
			</div>
		</form>
	</div>

	<hr>
	<h3>Lista Usuários</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div> <br/>

	<table id="tabelaListaUsuario" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="width: 30%; vertical-align: middle; text-align: center;">Nome</th>
				<th style="width: 20%; vertical-align: middle;">Login</th>
				<th style="width: 35%; vertical-align: middle; text-align: center;">E-mail</th>
				<th style="width: 15%; vertical-align: middle; text-align: center;">Ações</th>
			</tr>
		</thead>
		<c:forEach var="usuario" items="${listaUsuario}">
				<tr>
					<td style="vertical-align: middle; text-align: center;">${usuario.nome}</td>
					<td style="vertical-align: middle; text-align: center;">${usuario.login}</td>
					<td style="vertical-align: middle; text-align: center;">${usuario.email}</td>
					<td style="vertical-align: middle; text-align: center;">
						<a href="edit?id=${usuario.id}">Alterar</a> &nbsp; &nbsp;
						<a href="delete?id=${usuario.id}">Remover</a>					
					</td>
				</tr>
		</c:forEach>
	</table>

</body>
</html>
