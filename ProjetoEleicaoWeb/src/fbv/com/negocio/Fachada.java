package fbv.com.negocio;

import java.sql.SQLException;
import java.util.ArrayList;

import fbv.com.excecoes.ExcecaoAcessoRepositorio;
import fbv.com.excecoes.ExcecaoRegistroJaExistente;
import fbv.com.excecoes.ExcecaoRegistroNaoExistente;

public class Fachada {
 
	private ControladorEleicao controladorEleicao;
	
	private ControladorLogin controladorLogin;
	
	private static Fachada fachada = null;
	
	public static Fachada getInstancia() throws ExcecaoAcessoRepositorio, SQLException{
		
		if(fachada == null){
			fachada = new Fachada();
		}
		
		return fachada;
	}
	
	private Fachada() throws ExcecaoAcessoRepositorio, SQLException{
		controladorEleicao = ControladorEleicao.getInstancia();
		controladorLogin = ControladorLogin.getInstancia();
	}
	
	/*
	 * EleicaoEscolhaUnica
	 * **/
	
	public void incluirEleicaoEscolhaUnica(EleicaoEscolhaUnica pEleicaoEscolhaUnica) throws SQLException, ExcecaoRegistroJaExistente{
		controladorEleicao.incluirEleicaoEscolhaUnica(pEleicaoEscolhaUnica);
	}
	
	public void alterarEleicaoEscolhaUnica(EleicaoEscolhaUnica pEleicaoEscolhaUnica) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.alterarEleicaoEscolhaUnica(pEleicaoEscolhaUnica);
	}
	
	public void excluirEleicaoEscolhaUnica(EleicaoEscolhaUnica pEleicaoEscolhaUnica) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.excluirEleicaoEscolhaUnica(pEleicaoEscolhaUnica);
	}
	
	public EleicaoEscolhaUnica consultarEleicaoPelaChave(EleicaoEscolhaUnica pEleicaoEscolhaUnica) throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarEleicaoPelaChave(pEleicaoEscolhaUnica);
	}
	
	public ArrayList<EleicaoEscolhaUnica> consultarTodosEleicaoEscolhaUnicas() throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarTodosEleicaoEscolhaUnicas();
	}
	
	/*
	 * EleicaoPontuacao
	 * **/
	
	public void incluirEleicaoPontuacao(EleicaoPontuacao pEleicaoPontuacao) throws SQLException, ExcecaoRegistroJaExistente{
		controladorEleicao.incluirEleicaoPontuacao(pEleicaoPontuacao);
	}
	
	public void alterarEleicaoPontuacao(EleicaoPontuacao pEleicaoPontuacao) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.alterarEleicaoPontuacao(pEleicaoPontuacao);
	}
	
	public void excluirEleicaoPontuacao(EleicaoPontuacao pEleicaoPontuacao) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.excluirEleicaoPontuacao(pEleicaoPontuacao);
	}
	
	public EleicaoPontuacao consultarEleicaoPelaChave(EleicaoPontuacao pEleicaoPontuacao) throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarEleicaoPelaChave(pEleicaoPontuacao);
	}
	
	public ArrayList<EleicaoPontuacao> consultarTodosEleicaoPontuacaos() throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarTodosEleicaoPontuacao();
	}
	
	/*
	 * Opcao de voto
	 * **/
	
	public void incluirOpcaoVoto(OpcaoVoto pOpcaoVoto) throws SQLException, ExcecaoRegistroJaExistente{
		controladorEleicao.incluirOpcaoVoto(pOpcaoVoto);
	}
	
	public void alterarOpcaoVoto(OpcaoVoto pOpcaoVoto) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.alterarOpcaoVoto(pOpcaoVoto);
	}
	
	public void excluirOpcaoVoto(OpcaoVoto pOpcaoVoto) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.excluirOpcaoVoto(pOpcaoVoto);
	}
	
	public OpcaoVoto consultarOpcaoVotoPelaChave(OpcaoVoto pOpcaoVoto) throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarOpcaoVotoPelaChave(pOpcaoVoto);
	}
	
	public ArrayList<OpcaoVoto> consultarTodosOpcaoVoto() throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarTodosOpcaoVoto();
	}
	
	/*
	 * Perfil de Usuario
	 * */
	
	public void incluirPerfilUsuario(PerfilUsuario pPerfilUsuario) throws SQLException, ExcecaoRegistroJaExistente{
		controladorLogin.incluirPerfilUsuario(pPerfilUsuario);
	}
	
	public void alterarPerfilUsuario(PerfilUsuario pPerfilUsuario) throws SQLException, ExcecaoAcessoRepositorio{
		controladorLogin.alterarPerfilUsuario(pPerfilUsuario);
	}
	
	public void excluirPerfilUsuario(PerfilUsuario pPerfilUsuario) throws SQLException, ExcecaoAcessoRepositorio{
		controladorLogin.excluirPerfilUsuario(pPerfilUsuario);
	}
	
	public PerfilUsuario consultarPerfilUsuarioPelaChave(PerfilUsuario pPerfilUsuario) throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorLogin.consultarPerfilUsuarioPelaChave(pPerfilUsuario);
	}
	
	public ArrayList<PerfilUsuario> consultarTodosPerfilUsuario() throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorLogin.consultarTodosPerfilUsuario();
	}
	
	/**
	 * Usuario
	 * @throws SQLException 
	 * @throws ExcecaoRegistroJaExistente 
	 * **/
	
	public void incluirUsuario(Usuario pUsuario) throws SQLException, ExcecaoRegistroJaExistente{
		controladorLogin.incluirUsuario(pUsuario);
	}
	
	public void alterarUsuario(Usuario pUsuario) throws SQLException, ExcecaoAcessoRepositorio{
		controladorLogin.alterarUsuario(pUsuario);
	}
	
	public void excluirUsuario(Usuario pUsuario) throws SQLException, ExcecaoAcessoRepositorio{
		controladorLogin.excluirUsuario(pUsuario);
	}
	
	public Usuario consultarUsuarioPelaChave(Usuario pUsuario) throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorLogin.consultarUsuarioPelaChave(pUsuario);
	}
	
	public ArrayList<Usuario> consultarTodosUsuario() throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorLogin.consultarTodosUsuario();
	}
	
	/*
	 * Voto
	 * **/
	
	public void incluirVoto(Voto pVoto) throws SQLException, ExcecaoRegistroJaExistente{
		controladorEleicao.incluirVoto(pVoto);
	}
	
	public void alterarVoto(Voto pVoto) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.alterarVoto(pVoto);
	}
	
	public void excluirVoto(Voto pVoto) throws SQLException, ExcecaoAcessoRepositorio{
		controladorEleicao.excluirVoto(pVoto);
	}
	
	public Voto consultarVotoPelaChave(Voto pVoto) throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarVotoPelaChave(pVoto);
	}
	
	public ArrayList<Voto> consultarTodosVoto() throws SQLException, ExcecaoRegistroNaoExistente{
		return controladorEleicao.consultarTodosVoto();
	}
}
 