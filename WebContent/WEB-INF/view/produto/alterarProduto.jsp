<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alterar Produto</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">

<br />
	<c:import url="/WEB-INF/view/comum/menu.jsp" />

	<hr>
	<h3>Alterar Produto</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div>
	
	<form action="update" method="post">
	
		<input type="hidden" name="id" value="${produto.id}">

		<div class="form-group">
			<label for="inputCodigo">Código</label>
			<input type="text" id="inputCodigo" class="form-control" name="codigo" style="width: 100px;" maxlength="5" required="required" value="${produto.codigo}" />
		</div>
		
		<div class="form-group">
			<label for="inputDescricao">Descrição</label>
			<input type="text" id="inputDescricao" class="form-control" name="descricao" style="width: 500px;" maxlength="100" required="required" value="${produto.descricao}" />
		</div>
		
		<div class="form-group">
			<label for="categoriaProduto">Categoria</label> <br />
			<select id="categoriaProduto" name="categoriaProduto" style="width: 200px; height: 30px; border: 1px solid #BDC7D8; color: #000000; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
				<option value=""> Selecione </option>
				<c:forEach items="${listaCategoriaProduto}" var="obj">
					<option value="${obj.id}" <c:if test="${obj.id eq produto.categoriaProduto.id}">selected="selected"</c:if>> ${obj.descricao} </option>
				</c:forEach> 
			</select>
		</div>
		
		<div class="form-group">
			<label for="inputPrecoCusto">Preco de Custo</label>
			<input type="text" id="inputPrecoCusto" class="form-control" name="precoCusto" style="width: 100px;" required="required" value="${produto.precoCusto}" />
		</div>
		
		<div class="form-group">
			<label for="inputPrecoVenda">Preço de Venda</label>
			<input type="text" id="inputPrecoVenda" class="form-control" name="precoVenda" style="width: 100px;" required="required" value="${produto.precoVenda}" />
		</div>
		
		<div class="form-group">
			<label for="inputGarantia">Garantia</label>
			<input type="text" id="inputGarantia" class="form-control" name="garantia" style="width: 100px;" required="required" value="<fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" />" />
		</div>
		
		<div class="form-group">
			<label for="inputQuantidade">Quantidade</label>
			<input type="text" id="inputQuantidade" class="form-control" name="quantidade" style="width: 50px;" required="required" value="${produto.quantidade}" />
		</div>
		
		<div class="form-group">
			<label>Foto do Produto</label> <br/>
			<input type="hidden" name="imagem" value="${produto.imagem}">
			<img src="<%=request.getContextPath()%>/resources/img/${produto.imagem}" style="width: 30%;">
		</div>
		
		<br />
		
		<div class="form-group">
			<a href="listarProduto" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
			<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
			<button type="submit" class="btn btn-primary"> &nbsp; Alterar &nbsp; </button>
		</div>
		
	</form>

</body>
</html>