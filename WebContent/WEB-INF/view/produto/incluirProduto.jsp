<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Produto</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">

	<hr>
	<h3>Incluir Produto</h3>
	<hr>
	
	<form action="save" method="post" enctype="multipart/form-data">

		<div class="form-group">
			<label for="inputCodigo">Código</label>
			<input type="text" id="inputCodigo" class="form-control" name="codigo" style="width: 100px;" maxlength="5" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputDescricao">Descrição</label>
			<input type="text" id="inputDescricao" class="form-control" name="descricao" style="width: 500px;" maxlength="100" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputPrecoCusto">Preco de Custo</label>
			<input type="text" id="inputPrecoCusto" class="form-control" name="precoCusto" style="width: 100px;" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputPrecoVenda">Preço de Venda</label>
			<input type="text" id="inputPrecoVenda" class="form-control" name="precoVenda" style="width: 100px;" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputGarantia">Garantia</label>
			<input type="text" id="inputGarantia" class="form-control" name="garantia" style="width: 100px;" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputQuantidade">Quantidade</label>
			<input type="text" id="inputQuantidade" class="form-control" name="quantidade" style="width: 50px;" required="required" />
		</div>
		
		<div class="form-group">
			<label for="inputImagem">Imagem do Produto</label>
			<input type="file" id="inputImagem" name="file">
		</div>
		
		<br />
		
		<div class="form-group">
			<a href="listarProduto" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
			<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
			<button type="submit" class="btn btn-primary"> &nbsp; Inserir &nbsp; </button>
		</div>
		
	</form>

</body>
</html>