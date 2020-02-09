package br.usjt.arqsw.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.usjt.arqsw.dao.UsuarioDAO;
import br.usjt.arqsw.entity.Usuario;

@Service
public class UsuarioService {
	UsuarioDAO dao;
	
	@Autowired
	public UsuarioService(UsuarioDAO dao){
		this.dao = dao;
	}
	
	public void novoUsuario(Usuario usuario) throws IOException{
		dao.inserir(usuario);
	}
	
	public Usuario carregarUsuario(int id) throws IOException{
		return dao.carregar(id);
	}
	
	@Transactional
	public int excluirUsuario(int id) throws IOException {
		return dao.excluir(id);
	}
	
	@Transactional
	public int editarUsuario(Usuario usuario) throws IOException {
		return dao.editar(usuario);
	}
	
	public List<Usuario> listarUsuarios() throws IOException {
		return dao.listar();
	}
	
	public Usuario loginUsuario(Usuario usuario) throws IOException {
		return dao.logar(usuario.getLogin(), usuario.getSenha());     
	}

}
