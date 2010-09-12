<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="fbv.com.servlets.ServletPerfilUsuario"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./estilo/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="./estilo/estilo.css">
<script type="text/javascript" src="js/biblioteca_funcoes_eleicao.js" ></script>
<title>Inclus�o Perfil Usu�rio</title>
</head>
<%
	try{
%>
<script type="text/javascript">

function eventoProcessarInclusao() {
	
	if (document.forms.form_principal.<%=ServletPerfilUsuario.ID_REQ_CODIGO_PERFIL_USUARIO%>.value == "") {
		alert("Campo Obrigat�rio - C�digo do Perfil de Usu�rio!");
		return false;
	}
	
	document.forms.form_principal.<%=ServletPerfilUsuario.ID_REQ_EVENTO%>.value = "<%=ServletPerfilUsuario.ID_REQ_EVENTO_PROCESSAR_INCLUSAO%>";
	document.forms.form_principal.submit();
}

</script>
<body onload="setarFoco(document.forms.form_principal.<%=ServletPerfilUsuario.ID_REQ_CODIGO_PERFIL_USUARIO%>)">
<form action="/ProjetoEleicaoWeb/ServletPerfilUsuario" method="post" id="form_principal">
	<input type="hidden" id="<%=ServletPerfilUsuario.ID_REQ_EVENTO%>" name="<%=ServletPerfilUsuario.ID_REQ_EVENTO%>" value="">
<div id="header">
	<div id="logo">
		<h1><a href="#">Projeto Elei��o</a></h1>
		<p>FBV - Faculdade Boa Viagem</p>
	</div>
	<!-- end #logo -->
	<div id="menu">
		<ul>
			<li class="first"><a href="/ProjetoEleicaoWeb/ServletMenu">Home</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletEleicao">Elei��o</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletOpcaoVoto">Op��es de Voto</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletUsuario">Usu�rio</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletPerfilUsuario">Perfil de Usu�rio</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletVoto">Voto</a></li>
		</ul>
	</div>
	<!-- end #menu -->
</div>
	<table width="80%" border="0" align="center">
		<div id="sidebar">
		<div id="sidebar-bgtop"></div>
		<div id="sidebar-content">
		<tr>
			<td colspan="4">
				<div class="post">
					<h1 class="title">Inclus�o Perfil de Usu�rio</h1>
				</div>
			</td>
		</tr>
		<tr>
			<th class="td" width="22%">C�digo:</th>
			<td class="valordado"><input type="text" id="<%=ServletPerfilUsuario.ID_REQ_CODIGO_PERFIL_USUARIO%>" name="<%=ServletPerfilUsuario.ID_REQ_CODIGO_PERFIL_USUARIO%>" value="" size="8" maxlength="10"></td>
		</tr>
		<tr>
			<th class="td" width="22%">Descri��o:</th>
			<td class="valordado"><input type="text" id="<%=ServletPerfilUsuario.ID_REQ_DESCRICAO_PERFIL_USUARIO%>" name="<%=ServletPerfilUsuario.ID_REQ_DESCRICAO_PERFIL_USUARIO%>" value="" size="45" maxlength="45"></td>
		</tr>

		<tr>
			<td class="linhabotao"><input type="button" id="botaoVoltar" name="botaoVoltar" onclick="history.back()" value="Voltar"></td>
			<td class="linhabotao"><input type="button" id="botaoConfirmar" name="botaoConfirmar" onclick="eventoProcessarInclusao()" value="Confirmar"> </td>
		</tr>
	<div id="sidebar-bgbtm"></div>
		</div>
		</table>
		<div id="footer">
		<p>&copy; 2010. All Rights Reserved.</p>
	</div>
</form>
<% }catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>