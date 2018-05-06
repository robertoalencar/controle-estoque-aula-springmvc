<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Produto</title>

<link rel="stylesheet" type="text/css" href="WEB-INF/view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="WEB-INF/view/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>

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
		
		<p>
			Preco de Custo: <br />
			<input type="text" name="precoCusto" />
		</p>
		
		<p>
			Preco de Venda: <br />
			<input type="text" name="precoVenda" />
		</p>
		
		<p>
			Garantia: <br />
			<input type="text" name="garantia" />
		</p>
		
		<p>
			Quantidade: <br />
			<input type="text" name="quantidade" />
		</p>
		
		<p>
			Foto do Produto: <br />
			<input type="file" name="file">
		</p>
		
		<p> 
			<input type="submit" value="Inserir"> 
		</p>
		
	</form>

</body>
</html>