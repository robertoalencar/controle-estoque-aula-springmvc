<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exibir Produto</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">

	<br />

	<c:import url="/WEB-INF/view/comum/menu.jsp" />

	<hr>
	<h3>Detalhar Produto</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div>
	
	<form action="<%=request.getContextPath()%>/venda/addCarrinho" method="post">
	
		<input type="hidden" name="id" value="${produto.id}">

		<div class="form-group">
			<label>Código: </label> &nbsp; ${produto.codigo}
		</div>
		
		<div class="form-group">
			<label>Descrição:</label> &nbsp; ${produto.descricao}
		</div>
		
		<div class="form-group">
			<label>Categoria:</label> &nbsp; ${produto.categoriaProduto.descricao}
		</div>
		
		<div class="form-group">
			<label>Preco de Venda:</label> &nbsp; ${produto.precoVenda}
		</div>
		
		<div class="form-group">
			<label>Garantia:</label> &nbsp; <fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" />
		</div>
		
		<div class="form-group">
			<label>Quantidade em Estoque:</label> &nbsp; ${produto.quantidade}
		</div>
		
		<div class="form-group">
			<label>Produto:</label> &nbsp; <img src="<%=request.getContextPath()%>/resources/img/${produto.imagem}" style="width: 30%;">
		</div>
		
		<div class="form-group">
			<label>Quantidade</label>
			<input type="text" class="form-control" name="qtdCarrinho" style="width: 100px;" />
		</div>
		
		<br />
		
		<div class="form-group">
			<a href="<%=request.getContextPath()%>/produto/list"" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
			<button type="submit" class="btn btn-primary"> &nbsp; Adicionar &nbsp; </button>
		</div>
		
	</form>

</body>
</html>