package br.usjt.arqsw.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import br.usjt.arqsw.dao.ProdutoDAO;
import br.usjt.arqsw.entity.Produto;

@Service
public class ProdutoService {
	ProdutoDAO dao;
	
	@Autowired
	public ProdutoService(ProdutoDAO dao){
		this.dao = dao;
	}
	
	public void novoProduto(Produto produto) throws IOException{
		dao.inserir(produto);
	}
	
	public Produto carregarProduto(int id) throws IOException{
		return dao.carregar(id);
	}
	
	@Transactional
	public int excluirProduto(int id) throws IOException {
		return dao.excluir(id);
	}
	
	@Transactional
	public int editarProduto(Produto produto) throws IOException {
		return dao.editar(produto);
	}
	
	public List<Produto> listarProdutos(Produto produto) throws IOException{
		return dao.listar(produto);
	}
	
	public List<Produto> listarProdutosDecrescente(Produto produto) throws IOException{
		return dao.listarDescrescente(produto);
	}
	
	public void gravarImagem(ServletContext servletContext, Produto produto, MultipartFile file)
			throws IOException {
		if (!file.isEmpty()) {
			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			String path = servletContext.getRealPath(servletContext	.getContextPath());
			int k = path.lastIndexOf(File.separatorChar);
			path = path.substring(0, k);
			String nomeArquivo = "img"+produto.getId()+".jpg";
			produto.setImagem(nomeArquivo);
			editarProduto(produto);
			File destination = new File(path + File.separatorChar + "img" + File.separatorChar + nomeArquivo);
			if(destination.exists()){
				destination.delete();
			}
			ImageIO.write(src, "jpg", destination);
		}
	}

}
