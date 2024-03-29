<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="fbv.com.negocio.Voto"%>
<%@page import="fbv.com.servlets.ServletVoto"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./estilo/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="./estilo/estilo.css">
<script type="text/javascript" src="js/biblioteca_funcoes_eleicao.js" ></script>
<title>Consulta Voto</title>
</head>
<%
	try{
		
	//Obtem Par�metros do request	
	ArrayList<Voto> arrayListVoto = (ArrayList<Voto>) request.getAttribute(ServletVoto.ID_REQ_ARRAY_LIST_VOTO);
	
%>

<body onload="setarFoco(document.forms.form_principal.<%=ServletVoto.ID_REQ_ID_VOTO%>)">
<form action="/ProjetoEleicaoWeb/ServletVoto" method="post" id="form_principal">
<input type="hidden" id="<%=ServletVoto.ID_REQ_EVENTO%>" name="<%=ServletVoto.ID_REQ_EVENTO%>" value="">
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
			<li><a href="/ProjetoEleicaoWeb/ServletVoto">Voto</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletResultado">Resultado</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletUsuario">Usu�rio</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletPerfilUsuario">Perfis</a></li>
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
					<h1 class="title">Consulta Voto</h1>
				</div>
			</td>
		</tr>
		<tr>
			<th class="td" width="22%">C�digo do Voto:</th>	
			<td><input type="text" id="<%=ServletVoto.ID_REQ_ID_VOTO%>" name="codigoName" value="" size="16" maxlength="10">
								  <input type="button"  id="botaoConsultar" name="botaoConsultar" onclick="eventoConsultar()" value="Localizar"></td>
		</tr>
		</table>
	
	<table width="80%" border="0" align="center">
		<div id="sidebar">
		<td class="td" width="3%">&nbsp;&nbsp;&nbsp;#</th>
		<td class="td" align="center">C�digo</td>
		<td class="td" align="center">Usu�rio</td>
		<td class="td" align="center">C�digo Elei��o</td>
		<td class="td" align="center">Descri��o Elei��o</td>
		<td class="td" align="center">Op��o de Voto</td>
		<td class="td" align="center">Valor Voto</td>
		<td class="td" align="center">Data</td>
		
		<%
		//Exibindo dados
		if(arrayListVoto != null && !arrayListVoto.isEmpty()){
			String checked = null;
			String classeLinha = "";
			for(int i = 0 ; i < arrayListVoto.size() ; i++){
				
				checked = "";
				Voto voto = arrayListVoto.get(i);
				
				if(i == 0){
					checked="checked";
				}
				if (i % 2 == 0) {
					classeLinha = "linhaimpar";
				} else {
					classeLinha = "linhapar";
				}
				
		%>
		<tr>
			<td class="<%=classeLinha%>" align="center"><input type="radio" id="<%=ServletVoto.ID_REQ_CHAVE_PRIMARIA%>" name="<%=ServletVoto.ID_REQ_CHAVE_PRIMARIA%>" <%=checked%> value="<%=voto.getIdVoto()%>"> </td>
			<td class="<%=classeLinha%>" align="center"><%=voto.getIdVoto()%></td>
			<td class="<%=classeLinha%>" align="center"><%=voto.getUsuario() != null ? voto.getUsuario().getNome() : ""%></td>
			<td class="<%=classeLinha%>" align="center"><%=voto.getEleicao() != null ? voto.getEleicao().getId() : ""%></td>
			<td class="<%=classeLinha%>" align="center"><%=voto.getEleicao() != null ? voto.getEleicao().getDescricao() : ""%></td>
			<td class="<%=classeLinha%>" align="center"><%=voto.getOpcaoVoto() != null ? voto.getOpcaoVoto().getDescricao() : ""%></td>
			<td class="<%=classeLinha%>" align="center"><%=voto.getValorVoto()%></td>
			<td class="<%=classeLinha%>" align="center"><%=voto.getDataHora()%></td>
			
		</tr>
		<%
			}
		}
		%>
		<tr>
			<td class="linhabotao">
				<input type="button" id="botaoVoltar" name="botaoVoltar" value="Voltar" onclick="eventoIncluir()">
			</td>
		</tr>
		</div>
		
		<div id="sidebar-bgbtm"></div>
		</table>
		<div id="footer"><p>&copy; 2010. All Rights Reserved.</p></div>

</form>

<%
	}catch(Exception e){
		e.printStackTrace();
	}

%>
</body>
</html>