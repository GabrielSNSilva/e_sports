package br.usjt.arqsw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import br.usjt.arqsw.entity.Produto;
import br.usjt.arqsw.entity.Usuario;
import br.usjt.arqsw.service.ProdutoService;
import br.usjt.arqsw.service.UsuarioService;

@RestController
public class ManterRestController {
	ProdutoService produtoService;
	UsuarioService usuarioService;
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	public ManterRestController(ProdutoService ps, UsuarioService us) {
		produtoService = ps;
		usuarioService = us;
	}
	
	
	
	/* PRODUTO */
	@Transactional
	@RequestMapping(method=RequestMethod.POST, value="rest/novo_produto")
	public ResponseEntity<Produto> novoProduto(@RequestBody Produto produto, @RequestParam("file") MultipartFile file){
		try{
			System.out.println("Produto = "+ produto);
			System.out.println("ID = " + produto.getId());
			System.out.println("Nome = " + produto.getNome());
			System.out.println("Preço = " + produto.getPreco());
			System.out.println("Imagem = " + produto.getImagem());

			
			produtoService.novoProduto(produto);
			produtoService.gravarImagem(servletContext, produto, file);
			return new ResponseEntity<Produto>(produto, HttpStatus.OK);
		} catch(IOException e){
			e.printStackTrace();
			return new ResponseEntity<Produto>(produto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="rest/listar_produtos")
	public @ResponseBody List<Produto> listarProdutos(Produto produto) {
		List<Produto> lista = null;
		try{
			if(produto == null || produto.equals("")){
				lista = produtoService.listarProdutos();
			} else {
				lista = produtoService.listarProdutos();
			}
		} catch(IOException e){
			e.printStackTrace();
		}
		return lista;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="rest/visualizar_produto/{id}")
	public @ResponseBody Produto visualizarProduto(@PathVariable("id") int id) {
		Produto produto = null, param;
		try{
			param = new Produto();
			param.setId(id);
			produto = produtoService.carregarProduto(id);
		} catch(IOException e){
			e.printStackTrace();
		}
		return produto;
	}
	
	
	

	/* USUARIO */
	@Transactional
	@RequestMapping(method=RequestMethod.POST, value="rest/novo_usuario")
	public ResponseEntity<Usuario> novoUsuario(@RequestBody Usuario usuario){
		try{
			System.out.println("Usuario = "+ usuario);			
			usuarioService.novoUsuario(usuario);
			return new ResponseEntity<Usuario>(usuario, HttpStatus.OK);
		} catch(IOException e){
			e.printStackTrace();
			return new ResponseEntity<Usuario>(usuario, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="rest/listar_usuarios")
	public @ResponseBody List<Usuario> listarUsuarios(Usuario usuario) {
		List<Usuario> lista = null;
		try{
			if(usuario == null || usuario.equals("")){
				lista = usuarioService.listarUsuarios();
			} else {
				lista = usuarioService.listarUsuarios();
			}
		} catch(IOException e){
			e.printStackTrace();
		}
		return lista;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="rest/visualizar_usuario/{id}")
	public @ResponseBody Usuario visualizarUsuario(@PathVariable("id") int id) {
		Usuario usuario = null, param;
		try{
			param = new Usuario();
			param.setId(id);
			usuario = usuarioService.carregarUsuario(id);
		} catch(IOException e){
			e.printStackTrace();
		}
		return usuario;
	}

}
