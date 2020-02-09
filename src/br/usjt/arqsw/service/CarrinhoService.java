package br.usjt.arqsw.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.usjt.arqsw.dao.CarrinhoDAO;
import br.usjt.arqsw.entity.Carrinho;

@Service 
public class CarrinhoService {
	CarrinhoDAO dao;
	
	@Autowired
	public CarrinhoService(CarrinhoDAO dao){
		this.dao = dao;
	}
	
	public int inserirProdutoCarrinho(Carrinho carrinho) throws IOException{
		carrinho.setTotal(carrinho.getPreco() * carrinho.getQuantidade());
		return dao.inserir(carrinho);
	}
	
	public List<Carrinho> listarProdutoCarrinho() throws IOException{
		return dao.listar();
	}
	
	@Transactional
	public int excluirProdutoCarrinho(int id) throws IOException {
		return dao.excluir(id);
	}

}
