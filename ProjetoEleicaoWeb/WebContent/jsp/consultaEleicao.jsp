<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="fbv.com.negocio.Eleicao"%>
<%@page import="fbv.com.servlets.ServletEleicao"%>
<%@page import="fbv.com.util.TipoEleicao"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<head>
	<title>Consulta Elei��o</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="./estilo/style.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="./estilo/estilo.css">
	<script type="text/javascript" src="js/biblioteca_funcoes_eleicao.js" ></script>
</head>
<%
	try{
		
	//Obtem Par�metros do request	
	@SuppressWarnings("unchecked")
	ArrayList<Eleicao> arrayListEleicao = (ArrayList<Eleicao>) request.getAttribute(ServletEleicao.ID_REQ_ARRAY_LIST_ELEICAO);
	
%>

<script type="text/javascript" >

function eventoAlterar() {
	<%
	if (arrayListEleicao != null && arrayListEleicao.size() > 0) {
	%>

		document.forms.form_principal.<%=ServletEleicao.ID_REQ_EVENTO%>.value = "<%=ServletEleicao.ID_REQ_EVENTO_EXIBIR_ALTERACAO%>";
		document.forms.form_principal.submit();
	<%
	} else {	
	%>
		alert("Nenhum Registro Selecionado!");
		return false;
	<%
	}
	%>
}

function eventoExcluir(){
	<%
	if(arrayListEleicao != null && arrayListEleicao.size() > 0){
	%>

		document.forms.form_principal.<%=ServletEleicao.ID_REQ_EVENTO%>.value = "<%=ServletEleicao.ID_REQ_EVENTO_EXIBIR_EXCLUSAO%>";
		document.forms.form_principal.submit();
	<%
	}else{	
	%>
		alert("Nenhum Registro Selecionado!");
		return false;
	<%
	}
	%>
}

</script>
<body onload="setarFoco(document.forms.form_principal.<%=ServletEleicao.ID_REQ_CODIGO_ELEICAO%>)">
<form action="/ProjetoEleicaoWeb/ServletEleicao" method="post" id="form_principal">
<input type="hidden" id="<%=ServletEleicao.ID_REQ_EVENTO%>" name="<%=ServletEleicao.ID_REQ_EVENTO%>" value="">
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
			<li><a href="/ProjetoEleicaoWeb/ServletUsuario">Usu�rio</a></li>
			<li><a href="/ProjetoEleicaoWeb/ServletPerfilUsuario">Perfil de Usu�rio</a></li>

		</ul>
	</div>
	<!-- end #menu -->
</div>
	<table width="80%" border="0" align="center">
		<tr>
			<td colspan="4">
				<div class="post">
					<h1 class="title">Consultar Elei��o </h1>
				</div>
			</td>
		</tr>
		<div id="sidebar">
		<div id="sidebar-bgtop"></div>
		<div id="sidebar-content">
		<tr>
			<td width="80px" class="td" align="right">
				Tipo:
			</td>
			<td width="100px">
				<select id="<%= ServletEleicao.ID_REQ_TIPO_ELEICAO %>" name="<%= ServletEleicao.ID_REQ_TIPO_ELEICAO %>">
					<option value="<%= TipoEleicao.ESCOLHA_UNICA.value() %>" <%= request.getAttribute(ServletEleicao.ID_REQ_TIPO_ELEICAO).equals(TipoEleicao.ESCOLHA_UNICA.value())? "selected": "" %>>Escolha �nica</option>
					<option value="<%= TipoEleicao.PONTUACAO.value() %>" <%= request.getAttribute(ServletEleicao.ID_REQ_TIPO_ELEICAO).equals(TipoEleicao.PONTUACAO.value())? "selected": "" %>>Pontua��o</option>
				</select>
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="td" align="right">
				C�digo:
			</td>
			<td>
				<input type="text" id="<%=ServletEleicao.ID_REQ_CODIGO_ELEICAO%>" name="<%=ServletEleicao.ID_REQ_CODIGO_ELEICAO%>" value="" ></input>
			</td>
			<td><input type="button"  id="botaoConsultar" name="botaoConsultar" onclick="eventoConsultar()" value="Localizar"  ></td>
		</tr>
	</table>
	<br/>
	<table width="80%" border="0" align="center">
		<tr>
			<th class="td" width="10%" align="center">#</th>
			<th class="td" width="10%" align="center">C�digo</th>
			<th class="td" width="40%" align="center">Descri��o</th>
			<th class="td" width="10px" align="center">Estado</th>
			<th class="td" width="10px" align="center">Data Abertura</th>
			<th class="td" width="10px" align="center">Data Encerramento</th>
		</tr>
		<%
		//Exibindo dados
		if(arrayListEleicao != null && !arrayListEleicao.isEmpty()){
			String checked = null;
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			for(int i = 0 ; i < arrayListEleicao.size() ; i++){
				
				checked = "";
				Eleicao eleicao = arrayListEleicao.get(i);
				
				if(i == 0){
					checked="checked";
				}
				
				String classeLinha;
				if (i % 2 == 0) {
					classeLinha = "linhaimpar";
				} else {
					classeLinha = "linhapar";
				}
		%>
		<tr>
			<td class="<%= classeLinha %>"><input type="radio" id="<%=ServletEleicao.ID_REQ_CHAVE_PRIMARIA%>" name="<%=ServletEleicao.ID_REQ_CHAVE_PRIMARIA%>" <%=checked%> value="<%=eleicao.getId()%>"> </td>
			<td class="<%= classeLinha %>" align="left"><%=eleicao.getId()%></td>
			<td class="<%= classeLinha %>" align="left"><%=eleicao.getDescricao()%></td>
			<td class="<%= classeLinha %>" align="left">
			<%
			switch (eleicao.getEstado().getValor()){
			case 1:
				out.print("NOVA");
				break;
			case 2:
				out.print("INICIADA");
				break;
			case 3:
				out.print("EM CURSO");
				break;
			case 4:
				out.print("EM APURACAO");
				break;
			case 5:
				out.print("CONCLUIDA");
				break;
			}
			%>
			</td>
			<td class="<%= classeLinha %>" align="center"><%= eleicao.getDataAbertura() != null ? sdf.format(eleicao.getDataAbertura()) : "" %></td>
			<td class="<%= classeLinha %>" align="center"><%= eleicao.getDataEncerramento() != null ? sdf.format(eleicao.getDataEncerramento()) : "" %></td>
		</tr>
		<%
			}
		}else if (arrayListEleicao != null){
		%>
		<%
		}
		%>		
	</table>
	<table width="80%" border="0" align="center">
		<tr>
			<td class="linhabotao" align="right"><input type="button" id="botaoIncluir" name="botaoIncluir" value="Incluir" onclick="eventoIncluir()"> </td>
			<td class="linhabotao" align="center"><input type="button" id="botaoAlterar" name="botaoAlterar" value="Alterar" onclick="eventoAlterar()"> </td>
			<td class="linhabotao" align="left"><input type="button" id="botaoExcluir" name="botaoExcluir" value="Excluir" onclick="eventoExcluir()"> </td>
		</tr>
	
	</table>
	<div id="footer">
		<p>&copy; 2010. All Rights Reserved.</p>
	</div>
	</div>
		<div id="sidebar-bgbtm"></div>
		</div>
</form>

<%
	}catch(Exception e){
		e.printStackTrace();
	}

%>
</body>
</html>