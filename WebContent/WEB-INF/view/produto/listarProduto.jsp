<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema de Controle de Estoque</title>

<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

</head>

<body style="margin-left: 5%; margin-right: 5%;">

	<br />
	<c:import url="/WEB-INF/view/comum/menu.jsp" />

	<hr> 
	<h3>Filtro Produtos</h3>
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
	<h3>Lista Produtos</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div> <br/>

	<table id="tabelaListaProduto" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="width: 5%; vertical-align: middle; text-align: center;">Código</th>
				<th style="width: 20%; vertical-align: middle;">Descrição</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Preço de Custo</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Preço de Venda</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Garantia</th>
				<th style="width: 5%; vertical-align: middle; text-align: center;">QTD</th>
				<th style="width: 10%; vertical-align: middle; text-align: center;">Imagem</th>
				<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
			</tr>
		</thead>
		<c:forEach var="produto" items="${listaProduto}">
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
								<img src="<%=request.getContextPath()%>/resources/img/${produto.imagem}" style="width: 30%;">
							</c:when>
							<c:otherwise>
								Imagem não carregada.
							</c:otherwise>
						</c:choose>
			    	</td>
					<td style="vertical-align: middle; text-align: center;">
						<a href="edit?id=${produto.id}">Alterar</a> &nbsp; &nbsp;
						<a href="delete?id=${produto.id}">Remover</a>  &nbsp; &nbsp;		
						<a href="view?id=${produto.id}">Comprar</a>
					</td>
				</tr>
		</c:forEach>
	</table>

</body>
</html>