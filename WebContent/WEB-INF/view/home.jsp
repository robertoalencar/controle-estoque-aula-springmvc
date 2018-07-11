<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Sistema de Controle de Estoque</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/estilo.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-2.1.4.js"></script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">

	<br />
	<c:import url="/WEB-INF/view/comum/menu.jsp" />
	
	<div align="right" style="color: #6E6E6E; margin-right: 2%;">
		Bem vindo, ${usuarioLogado.nome}
	</div>

	<div align="center" style="color: #6E6E6E; font-size: 30px;">
		<p>
			EstoqueControll 
		</p>
		<p>
			<img src="<%=request.getContextPath()%>/resources/img/controleEstoque.png" style="width: 25%;">
		</p>
	</div>
	
	<p style="margin-top: 5%;">
	
	<hr class="linhaSeparador">
	
	<div class="textoRodape">
		<p><c:import url="/WEB-INF/view/comum/textoRodape.jsp" /></p>
	</div>
	
</body>
</html>