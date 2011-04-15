/**Arquivo que possui fun��es javascript que s�o usadas 
 * por diversas jsp's do sistema
 *  
 */

//Usada para setar o foco no campo passado como par�metro
function setarFoco(pCampo){
	if (pCampo != null){
		pCampo.focus();
	}
}

//Seta o evento de ProcessarFiltroConsulta
function eventoConsultar() {
	document.forms.form_principal.idEvento.value = "processarFiltroConsulta";
	document.forms.form_principal.submit();
}

//Seta o evento de ExibirInclus�o
function eventoIncluir() {
	document.forms.form_principal.idEvento.value = "exibirInclusao";
	document.forms.form_principal.submit();
}