<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="fbv.com.servlets.ServletPerfilUsuario"%>

<html>
<%
try {
		
	String Mensagem = (String) request.getAttribute(ServletPerfilUsuario.ID_REQ_MENSAGEM);
	String nomeServlet = (String) request.getAttribute(ServletPerfilUsuario.ID_REQ_NOME_SERVLET);
	
	//Monta o action do formul�rio dinamicamente
	String actionFormulario = "/ProjetoEleicaoWeb/" + nomeServlet;
	String tituloTela = "";
	
	if (nomeServlet.equals(ServletPerfilUsuario.ID_REQ_NOME_SERVLET_PERFIL_USUARIO)) {
		tituloTela = "Perfil de Usu�rio";
	} else if (nomeServlet.equals(ServletPerfilUsuario.ID_REQ_NOME_SERVLET_OPCAO_VOTO)) {
		tituloTela = "Op��o de Voto";
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./estilo/estilo.css">
<title><%=tituloTela%></title>
</head>
<body>
<form action="<%=actionFormulario%>" id="form_principal" name="form_principal" method="post">
	<table width="100%">
		<tr>
			<th class="header"><%=tituloTela%></th>
		</tr>
		<tr>
			<td class="mensagem"><%=Mensagem%></td>
		</tr>
		<tr>
			<th class="footer">&nbsp;</th>
		</tr>
		<tr>
			<td class="linhabotao"><input type="submit" id="botaoProsseguir" name="botaoProsseguir" value="Prosseguir" ></td>
		</tr>
	</table>
</form>
</body>
<%
} catch(Exception e) {
	e.printStackTrace();
}
%>
</html>