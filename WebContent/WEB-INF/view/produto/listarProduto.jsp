<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema de Controle de Estoque</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">

	<c:import url="/WEB-INF/view/comum/menu.jsp" />

	<hr>
	<h3>Listar Produto</h3>
	<hr>

	<jsp:useBean id="dao" class="br.com.ifpe.estoque.model.ProdutoDao"/>
	
	<table id="tabelaListaProduto" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="width: 5%; vertical-align: middle; text-align: center;">Código</th>
				<th style="width: 35%; vertical-align: middle;">Descrição</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Preço de Custo</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Preço de Venda</th>
				<th style="width: 5%; vertical-align: middle; text-align: center;">QTD</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Imagem</th>
				<th style="width: 15%; vertical-align: middle; text-align: center;">Ações</th>
			</tr>
		</thead>
		<c:forEach var="produto" items="${dao.listar()}">
				<tr>
					<td style="vertical-align: middle; text-align: center;">${produto.codigo}</td>
					<td style="vertical-align: middle;">${produto.descricao}</td>
					<td style="vertical-align: middle; text-align: center;">${produto.precoCusto}</td>
					<td style="vertical-align: middle; text-align: center;">${produto.precoVenda}</td>
			    	<td style="vertical-align: middle; text-align: center;"> ${produto.quantidade} </td>
			    	<td style="vertical-align: middle; text-align: center;"> <img src="<%=request.getContextPath()%>/resources/view/img/${produto.imagem}"> </td>
					<td style="vertical-align: middle; text-align: center;"> &nbsp;	</td>
				</tr>
		</c:forEach>
	</table>

</body>
</html>