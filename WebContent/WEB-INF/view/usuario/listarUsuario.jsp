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
					${mensagem}
				</div>
			</c:if>
			
			<div class="panel-group">
  				<div class="panel panel-default">
    				<div class="panel-heading">
      					<h4 class="panel-title">
        					<a data-toggle="collapse" href="#collapse1">Clique aqui para <strong>Filtrar</strong> os Usuários</a>
      					</h4>
    				</div>
    				<div id="collapse1" class="panel-collapse collapse">
      					<div class="panel-body">
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
    				</div>
  				</div>
			</div>
			
			<hr />
			
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;"> Listagem de <strong>Usuários</strong> </td>
						<td style="float: right;"> <a href="<%=request.getContextPath()%>/usuario/add" class="btn btn-primary" role="button">Novo</a> </td>
					</tr>
				</table>
			</p>
			
			<hr />

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
								<a href="edit?id=${usuario.id}" class="btn btn-warning" role="button">E</a> &nbsp;
								<a href="delete?id=${usuario.id}" class="btn btn-danger" role="button">R</a>					
							</td>
						</tr>
				</c:forEach>
			</table>
			
			<c:choose>
				<c:when test="${listaUsuario.size() == 0}">
					Não foram encontrados registros.
				</c:when>
				<c:otherwise>
					Total de Itens Listados: ${listaUsuario.size()}
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
