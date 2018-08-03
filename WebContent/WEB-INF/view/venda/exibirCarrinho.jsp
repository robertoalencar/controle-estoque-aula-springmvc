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
	<h3>Lista de Produtos Adicionados ao Carrrinho de Compras</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div> <br/>

	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="width: 30%; vertical-align: middle; text-align: center;">Produto</th>
				<th style="width: 20%; vertical-align: middle; text-align: center;">Imagem Produto</th>
				<th style="width: 20%; vertical-align: middle; text-align: center;">Valor Unitário</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Quantidade</th>
				<th style="width: 20%; vertical-align: middle; text-align: center;">Valor Total</th>
			</tr>
		</thead>
		<c:forEach var="itemVenda" items="${carrinho}">
				<tr>
					<td style="vertical-align: middle; text-align: center;">${itemVenda.produto.descricao}</td>
					<td style="vertical-align: middle; text-align: center;"><img src="<%=request.getContextPath()%>/resources/img/${itemVenda.produto.imagem}" style="width: 30%;"></td>
					<td style="vertical-align: middle; text-align: center;"> ${itemVenda.produto.precoVenda} </td>
			    	<td style="vertical-align: middle; text-align: center;"> ${itemVenda.quantidade} </td>
			    	<td style="vertical-align: middle; text-align: center;"> ${itemVenda.produto.precoVenda * itemVenda.quantidade} </td>
				</tr>
		</c:forEach>
	</table>

	<br/>
	
	Valor Parcial: ${valorTotal}

	<br /> <br />
	<a href="<%=request.getContextPath()%>/produto/list" class="btn btn-danger">Continuar Comprando</a> &nbsp; &nbsp;
	<a href="<%=request.getContextPath()%>/venda/save" class="btn btn-primary">Finalizar Venda</a>

</body>
</html>