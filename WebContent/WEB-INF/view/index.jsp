<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Sistema de Controle de Estoque</title>

<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

</head>

<body id="corpoPadrao">

	<div align="center" style="color: #6E6E6E;">
	
		<br />
	
		<table style="width: 70%;">
			<tr>
				<td align="left">
					<a href="<%=request.getContextPath()%>/usuario/add">Criar Conta</a> &nbsp; &nbsp;
				</td>
			</tr>
			<tr>
				<td style="text-align: left; width: 70%; vertical-align: bottom;">
					Bem vindo ao sistema <strong>EstoqueControl</strong>, informe seu login e senha para acessar o sistema.
				</td>
				<td style="text-align: right; width: 30%; vertical-align: bottom;">
					<img src="<%=request.getContextPath()%>/resources/img/LoginRed.jpg" style="width: 25%;">	
				</td>
			</tr>
		</table>
		
		<hr class="linhaSeparador" />
		
		<c:if test="${msg ne null}">
			<div class="alert alert-error" style="width: 70%;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				${msg}
			</div>
		</c:if>

		<div style="width: 20%; font-size: 20px;">

			<form action="efetuarLogin" method="post">

				<br/>

				<div class="form-group" style="text-align: left;">
    				<label for="inputLogin">Login</label>
    				<input type="text" class="form-control" id="inputLogin" name="login" value="${usuario.login}" maxlength="20" required="required" tabindex="1">
  				</div>
  				
  				<div class="form-group" style="text-align: left;">
    				<label for="inputSenha">Senha</label>
    				<input type="password" class="form-control" id="inputSenha" name="senha" value="${usuario.senha}" maxlength="20" required="required" tabindex="2">
  				</div>
  				
  				<br/>
  				
  				<button type="submit" class="btn btn-primary" tabindex="3" style="width: 100%; height: 50px;"> &nbsp; ENTRAR &nbsp; </button>
			</form>
		</div>
	</div>
	
	<p style="margin-top: 5%;">
	
	<hr class="linhaSeparador">
	
	<div class="textoRodape">
		<p><c:import url="/WEB-INF/view/comum/textoRodape.jsp" /></p>
	</div>
	
</body>
</html>