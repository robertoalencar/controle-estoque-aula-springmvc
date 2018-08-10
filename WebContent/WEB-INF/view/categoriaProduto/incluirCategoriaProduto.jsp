<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Categoria de Produto</title>

<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

</head>

<body style="margin-left: 5%; margin-right: 5%;">

<br />
	<c:import url="/WEB-INF/view/comum/menu.jsp" />

	<hr>
	<h3>Incluir Categoria de Produto</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> 
		${mensagem}
		<form:errors path="categoriaProduto.codigo" cssStyle="color:red" /> </br>
		<form:errors path="categoriaProduto.descricao" cssStyle="color:red" />
	</div>
	
	<form action="save" method="post">

		<div class="form-group">
			<label for="inputCodigo">Código</label>
			<input type="text" id="inputCodigo" class="form-control" name="codigo" style="width: 100px;" maxlength="5" />
		</div>
		
		<div class="form-group">
			<label for="inputDescricao">Descrição</label>
			<input type="text" id="inputDescricao" class="form-control" name="descricao" style="width: 500px;" maxlength="100" />
		</div>
		
		<br />
		
		<div class="form-group">
			<a href="<%=request.getContextPath()%>/categoriaProduto/list" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
			<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
			<button type="submit" class="btn btn-primary"> &nbsp; Inserir &nbsp; </button>
		</div>
		
	</form>

</body>
</html>