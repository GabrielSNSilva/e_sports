package br.usjt.arqsw.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.usjt.arqsw.dao.ConsumidorDAO;
import br.usjt.arqsw.entity.Consumidor;

@Service
public class ConsumidorService {
	ConsumidorDAO dao;
	
	@Autowired
	public ConsumidorService(ConsumidorDAO dao){
		this.dao = dao;
	}
	
	public void novoConsumidor(Consumidor consumidor) throws IOException{
		dao.inserir(consumidor);
	}
	
	public Consumidor carregarConsumidor(int id) throws IOException{
		return dao.carregar(id);
	}
	
	@Transactional
	public int excluirConsumidor(int id) throws IOException {
		return dao.excluir(id);
	}
	
	@Transactional
	public int editarConsumidor(Consumidor consumidor) throws IOException {
		return dao.editar(consumidor);
	}
	
	public List<Consumidor> listarConsumidores() throws IOException {
		return dao.listar();
	}
	
	public Consumidor loginConsumidor(Consumidor consumidor) throws IOException {
		return dao.logar(consumidor.getLogin(), consumidor.getSenha());     
	}

}
