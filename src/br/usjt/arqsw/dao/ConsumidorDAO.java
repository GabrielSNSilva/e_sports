package br.usjt.arqsw.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.usjt.arqsw.entity.Consumidor;

@Repository
public class ConsumidorDAO {
	@PersistenceContext
	EntityManager manager;
	
	public int inserir(Consumidor consumidor) throws IOException {
		manager.persist(consumidor);
		return consumidor.getId();
	}
	
	public List<Consumidor> listar() throws IOException{
		//conectei minha fila com a persistencia			
		String jpql = "select c from Consumidor c";
		
		Query query = manager.createQuery(jpql);

		List<Consumidor> result = query.getResultList();
		return result;
	}
	
	public Consumidor carregar(int id) throws IOException {
		return manager.find(Consumidor.class, id);
	}
	
	public int excluir(int id) throws IOException {
		Consumidor consumidor = manager.find(Consumidor.class, id);
		manager.remove(consumidor);
		return consumidor.getId();
	}
	
	public int editar(Consumidor consumidor) throws IOException {
		manager.merge(consumidor);		
		return consumidor.getId();
	}
	
	public Consumidor logar(String login, String senha) throws IOException {
		try {
			Consumidor consumidor = (Consumidor) manager
					.createQuery("select c from Consumidor c where c.login = :login and c.senha = :senha")
						.setParameter("login", login)
						.setParameter("senha", senha).getSingleResult();
			return consumidor;
		} catch (NoResultException e) {
            return null;
		}
    }

}
