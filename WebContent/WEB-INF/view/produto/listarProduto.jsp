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
	<h3>Listar Produto</h3>
	<hr>

	<jsp:useBean id="dao" class="br.com.ifpe.estoque.model.ProdutoDao"/>
	
	<table id="tabelaListaProduto" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="width: 5%; vertical-align: middle; text-align: center;">Código</th>
				<th style="width: 25%; vertical-align: middle;">Descrição</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Preço de Custo</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Preço de Venda</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Garantia</th>
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
					<td style="vertical-align: middle; text-align: center;"><fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" /></td>
			    	<td style="vertical-align: middle; text-align: center;"> ${produto.quantidade} </td>
			    	<td style="vertical-align: middle; text-align: center;"> 
			    		<c:choose>
							<c:when test="${not empty produto.imagem}">
								<img src="<%=request.getContextPath()%>/resources/view/img/${produto.imagem}">
							</c:when>
							<c:otherwise>
								Imagem não carregada.
							</c:otherwise>
						</c:choose>
			    	</td>
					<td style="vertical-align: middle; text-align: center;"> &nbsp;	</td>
				</tr>
		</c:forEach>
	</table>

</body>
</html>