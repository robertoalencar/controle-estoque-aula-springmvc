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

<script type="text/javascript">
	
	$(document).ready(function() {
	
		function carregaTabelaJSon() {

			var texto = $('#descricao').val();
			var idCategoria = $('#categoriaProduto').val();

			$.post("filter", {
				
				'descricao' : texto,
				'idCategoria' : idCategoria
				
			}, function(dadosJSON) {
				
				var linhas = '';
				var qtdItens = 0;
				
				$(dadosJSON).each(function (i) {
					
                    linhas += "<tr>";
                    
					linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].codigo + "</td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].categoriaProduto.descricao + "</td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].descricao + "</td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].precoCusto + "</td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].precoVenda + "</td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].garantia + "</td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].quantidade + "</td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'> <img src='<%=request.getContextPath()%>/resources/img/" + dadosJSON[i].imagem + "' style='width: 50%;'> </td>";
					linhas += "<td style='vertical-align: middle; text-align: center;'>";
					linhas += "<a href='view?id=" + dadosJSON[i].id + "' class='btn btn-primary'>V</a> &nbsp;";
					linhas += "<a href='edit?id=" + dadosJSON[i].id + "' class='btn btn-warning' role='button'>E</a> &nbsp;";
					linhas += "<a href='delete?id=" + dadosJSON[i].id + "' class='btn btn-danger' role='button'>R</a>";
					linhas += "</td>";
						
					linhas += "</tr>";
					
					qtdItens++;
                });
				
                $('#tabelaListaProduto').html(linhas);
                $('#totaLista').html(qtdItens);
			});
		}

		$("#descricao").keyup(function() {
			carregaTabelaJSon();
		});

		$("#categoriaProduto").change(function() {
			carregaTabelaJSon();
		});
	});
	
</script>

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
        					<a data-toggle="collapse" href="#collapse1">Clique aqui para <strong>Filtrar</strong> os Produtos</a>
      					</h4>
    				</div>
    				<div id="collapse1" class="panel-collapse collapse">
      					<div class="panel-body">
      						<div class="form-group" style="text-align: left;">
								<label for="descricao">Descrição:</label>
				   				<input type="text" class="form-control" id="descricao" name="descricao">
				 			</div>
							<div class="form-group" style="text-align: left;">
				   				<label for="categoriaProduto">Categoria:</label> <br />
				   				<select id="categoriaProduto" name="categoriaProduto" style="width: 200px; height: 30px; border: 1px solid #BDC7D8; color: #000000; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
									<option value=""> Selecione </option>
									<c:forEach items="${listaCategoriaProduto}" var="obj">
										<option value="${obj.id}" <c:if test="${obj.id eq produto.categoriaProduto.id}">selected="selected"</c:if>> ${obj.descricao} </option>
									</c:forEach> 
								</select>
							</div>
      					</div>
    				</div>
  				</div>
			</div>
			
			<hr />
			
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;"> Listagem de <strong>Produtos</strong> </td>
						<td style="float: right;"> <a href="<%=request.getContextPath()%>/produto/add" class="btn btn-primary" role="button">Novo</a> </td>
					</tr>
				</table>
			</p>
			
			<hr />

			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 5%; vertical-align: middle; text-align: center;">Código</th>
						<th style="width: 15%; vertical-align: middle; text-align: center;">Categoria</th>
						<th style="width: 20%; vertical-align: middle; text-align: center;">Descrição</th>
						<th style="width: 6%; vertical-align: middle; text-align: center;">Preço de Custo</th>
						<th style="width: 6%; vertical-align: middle; text-align: center;">Preço de Venda</th>
						<th style="width: 8%; vertical-align: middle; text-align: center;">Garantia</th>
						<th style="width: 5%; vertical-align: middle; text-align: center;">QTD</th>
						<th style="width: 10%; vertical-align: middle; text-align: center;">Imagem</th>
						<th style="width: 15%; vertical-align: middle; text-align: center;">Ações</th>
					</tr>
				</thead>
				<tbody id="tabelaListaProduto">
				<c:forEach var="produto" items="${listaProduto}">
						<tr>
							<td style="vertical-align: middle; text-align: center;">${produto.codigo}</td>
							<td style="vertical-align: middle; text-align: center;">${produto.categoriaProduto.descricao}</td>
							<td style="vertical-align: middle; text-align: center;">${produto.descricao}</td>
							<td style="vertical-align: middle; text-align: center;">${produto.precoCusto}</td>
							<td style="vertical-align: middle; text-align: center;">${produto.precoVenda}</td>
							<td style="vertical-align: middle; text-align: center;"><fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" /></td>
					    	<td style="vertical-align: middle; text-align: center;"> ${produto.quantidade} </td>
					    	<td style="vertical-align: middle; text-align: center;"> 
					    		<c:choose>
									<c:when test="${not empty produto.imagem}">
										<img src="<%=request.getContextPath()%>/resources/img/${produto.imagem}" style="width: 50%;">
									</c:when>
									<c:otherwise>
										Imagem não carregada.
									</c:otherwise>
								</c:choose>
					    	</td>
							<td style="vertical-align: middle; text-align: center;">
								<a href="view?id=${produto.id}" class="btn btn-primary">V</a> &nbsp;
								<a href="edit?id=${produto.id}" class="btn btn-warning" role="button">E</a> &nbsp;
								<a href="delete?id=${produto.id}" class="btn btn-danger" role="button">R</a>
							</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<c:choose>
				<c:when test="${listaProduto.size() == 0}">
					Não foram encontrados registros.
				</c:when>
				<c:otherwise>
					Total de Itens Listados: <label id="totaLista">${listaProduto.size()}</label>
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