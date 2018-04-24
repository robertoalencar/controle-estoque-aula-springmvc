<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Produto</title>
</head>
<body>

	<hr>
	<h3>Incluir Produto</h3>
	<hr>
	
	<form action="save" method="post">

		<p>
			Código: <br />
			<input type="text" name="codigo" />
		</p>
		
		<p>
			Descrição: <br />
			<input type="text" name="descricao" />
		</p>
		
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
			<input type="submit" value="Inserir"> 
		</p>
		
	</form>

</body>
</html>