package br.usjt.arqsw.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.usjt.arqsw.entity.Usuario;

@Repository
public class UsuarioDAO {
	@PersistenceContext
	EntityManager manager;
	
	public int inserir(Usuario usuario) throws IOException {
		manager.persist(usuario);
		return usuario.getId();
	}
	
	public List<Usuario> listar(Usuario usuario) throws IOException{
		//conectei minha fila com a persistencia			
		String jpql = "select u from Usuario u";
		
		Query query = manager.createQuery(jpql);

		List<Usuario> result = query.getResultList();
		return result;
	}
	
	public Usuario carregar(int id) throws IOException {
		return manager.find(Usuario.class, id);
	}
	
	public int excluir(int id) throws IOException {
		Usuario usuario = manager.find(Usuario.class, id);
		manager.remove(usuario);
		return usuario.getId();
	}
	
	public int editar(Usuario usuario) throws IOException {
		manager.merge(usuario);		
		return usuario.getId();
	}
	
	public Usuario validar(String login, String senha) throws IOException{
		String jpql = "select u from Usuario u where u.login=:login and u.senha=:senha";
		Query query = manager.createQuery(jpql);
		query.setParameter("login", login);
		query.setParameter("senha", senha);
		
		Usuario resultado = (Usuario)query.getSingleResult();
		return resultado;
		
	}

}
