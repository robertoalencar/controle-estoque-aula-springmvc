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
	
	<div align="center">
	
		<div align="left" style="color: #6E6E6E;">
		
			<c:if test="${msg ne null}">
				<div class="alert alert-success" style="width: 100%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>
			
			<div class="panel-group">
  				<div class="panel panel-default">
    				<div class="panel-heading">
      					<h4 class="panel-title">
        					<a data-toggle="collapse" href="#collapse1">Clique aqui para <strong>Filtrar</strong> as Categorias de Produtos</a>
      					</h4>
    				</div>
    				<div id="collapse1" class="panel-collapse collapse">
      					<div class="panel-body">
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
    				</div>
  				</div>
			</div>
			
			<hr />
			
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;"> Listagem de <strong>Categoria de Produtos</strong> </td>
						<td style="float: right;"> <a href="<%=request.getContextPath()%>/categoriaProduto/add" class="btn btn-primary" role="button">Novo</a> </td>
					</tr>
				</table>
			</p>
			
			<hr />

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
								<a href="edit?id=${categoriaProduto.id}" class="btn btn-warning" role="button">E</a> &nbsp;
								<a href="delete?id=${categoriaProduto.id}" class="btn btn-danger" role="button">R</a>					
							</td>
						</tr>
				</c:forEach>
			</table>
			
			<c:choose>
				<c:when test="${listaCategoriaProduto.size() == 0}">
					Não foram encontrados registros.
				</c:when>
				<c:otherwise>
					Total de Itens Listados: ${listaCategoriaProduto.size()}
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<br />
	
	<hr class="linhaSeparador">
	
	<div class="textoRodape">
		<p><c:import url="/WEB-INF/view/comum/textoRodape.jsp" /></p>
	</div>

</body>
</html>