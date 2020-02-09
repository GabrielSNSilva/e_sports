package br.usjt.arqsw.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.usjt.arqsw.entity.Carrinho;

@Repository 
public class CarrinhoDAO {
	@PersistenceContext
	EntityManager manager;
	
	public int inserir(Carrinho carrinho) throws IOException {
		manager.persist(carrinho);
		return carrinho.getId();
	}
	
	public List<Carrinho> listar() throws IOException{
		//conectei minha fila com a persistencia
		
		String jpql = "select c from Carrinho c";
		
		Query query = manager.createQuery(jpql);

		List<Carrinho> result = query.getResultList();
		return result;
	}
	
	public int excluir(int id) throws IOException {
		Carrinho carrinho = manager.find(Carrinho.class, id);
		manager.remove(carrinho);
		return carrinho.getId();
	}

}
