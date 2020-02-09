package br.usjt.arqsw.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.usjt.arqsw.entity.Produto;

@Repository
public class ProdutoDAO {
	@PersistenceContext
	EntityManager manager;
	
	public int inserir(Produto produto) throws IOException {
		manager.persist(produto);
		return produto.getId();
	}
	
	public List<Produto> listar() throws IOException{
		//conectei minha fila com a persistencia			
		String jpql = "select p from Produto p";
		
		Query query = manager.createQuery(jpql);

		List<Produto> result = query.getResultList();
		return result;
	}
	
	public List<Produto> listarDescrescente() throws IOException{
		//conectei minha fila com a persistencia			
		String jpql = "select p from Produto p order by p desc";
		
		Query query = manager.createQuery(jpql);

		List<Produto> result = query.getResultList();
		return result;
	}
	
	public Produto carregar(int id) throws IOException {
		return manager.find(Produto.class, id);
	}
	
	public int excluir(int id) throws IOException {
		Produto produto = manager.find(Produto.class, id);
		manager.remove(produto);
		return produto.getId();
	}
	
	public int editar(Produto produto) throws IOException {
		manager.merge(produto);		
		return produto.getId();
	}

}
