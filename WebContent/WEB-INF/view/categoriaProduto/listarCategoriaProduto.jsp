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
	<h3>Filtro Categoria de Produto</h3>
	<hr>
	
	<div>
		<form action="filter">
			<div class="form-group">
				<label for="inputCodigo">Código</label>
				<input type="text" id="inputCodigo" class="form-control" name="codigo" style="width: 100px;" maxlength="5" value="${produto.codigo}" />
			</div>
			<div class="form-group">
				<label for="inputDescricao">Descrição</label>
				<input type="text" id="inputDescricao" class="form-control" name="descricao" style="width: 500px;" maxlength="100" value="${produto.descricao}" />
			</div>
			<div class="form-group">
				<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
				<button type="submit" class="btn btn-primary"> &nbsp; Filtrar &nbsp; </button>
			</div>
		</form>
	</div>

	<hr>
	<h3>Lista Categoria de Produtos</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div> <br/>

	<table id="tabelaListaCategoriaProduto" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Código</th>
				<th style="width: 70%; vertical-align: middle;">Descrição</th>
				<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
			</tr>
		</thead>
		<c:forEach var="categoriaProduto" items="${listaCategoriaProduto}">
				<tr>
					<td style="vertical-align: middle; text-align: center;">${categoriaProduto.codigo}</td>
					<td style="vertical-align: middle;">${categoriaProduto.descricao}</td>
					<td style="vertical-align: middle; text-align: center;">
						<a href="edit?id=${categoriaProduto.id}">Alterar</a> &nbsp; &nbsp;
						<a href="delete?id=${categoriaProduto.id}">Remover</a>					
					</td>
				</tr>
		</c:forEach>
	</table>

</body>
</html>