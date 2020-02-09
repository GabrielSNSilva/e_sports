package br.usjt.arqsw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.usjt.arqsw.entity.Carrinho;
import br.usjt.arqsw.entity.Consumidor;
import br.usjt.arqsw.entity.Produto;
import br.usjt.arqsw.entity.Usuario;
import br.usjt.arqsw.service.CarrinhoService;
import br.usjt.arqsw.service.ConsumidorService;
import br.usjt.arqsw.service.ProdutoService;
import br.usjt.arqsw.service.UsuarioService;

@Transactional
@Controller
public class ManterController {
	ProdutoService produtoService;
	UsuarioService usuarioService;
	CarrinhoService carrinhoService;
	ConsumidorService consumidorService;
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	public ManterController(ProdutoService ps, UsuarioService us, CarrinhoService cs, ConsumidorService ls) {
		produtoService = ps;
		usuarioService = us;
		carrinhoService = cs;
		consumidorService = ls;
	}

	@RequestMapping("index")
	public String inicio(Model model) throws IOException {
		List<Produto> produtos = produtoService.listarProdutos();
		List<Produto> produtosDecrescente = produtoService.listarProdutosDecrescente();
		List<Carrinho> produtosCarrinho = carrinhoService.listarProdutoCarrinho();
		model.addAttribute("produtos", produtos);
		model.addAttribute("produtosDecrescente", produtosDecrescente);
		model.addAttribute("produtosCarrinho", produtosCarrinho);
		return "index";
	}
	
	
	
	/* ADMIN */
	@RequestMapping("tela_login_admin")
	public String telaLoginAdmin() {
		return "loginAdmin";
	}
	
	@RequestMapping("admin_index")
	public String admin() {
		return "admin/index";
	}
	
	
	
	/* PRODUTO */
	@RequestMapping("/cadastrar_produto")
	public String cadastrarProduto() {
		return "admin/produto/CadastrarProduto";
	}
	
	@RequestMapping("/novo_produto")
	public String novoProduto(@Valid Produto produto, BindingResult result, Model model, @RequestParam("file") MultipartFile file) {
		try {
			produtoService.novoProduto(produto);
			produtoService.gravarImagem(servletContext, produto, file);
			return "redirect:/listar_produtos";
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/listar_produtos")
	public String listarProdutos(Model model) {
		try {
			// TODO Código para carregar os chamados
			List<Produto> produtos = produtoService.listarProdutos();
			model.addAttribute("produtos", produtos);
			
			return "admin/produto/ListarProdutos";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}

	@RequestMapping("/visualizar_produto")
	public String visualizarProduto(@RequestParam int id, @Valid Produto produto, BindingResult result, Model model) {
		try {
			// TODO Código para carregar os chamados
			produto = produtoService.carregarProduto(id);
			model.addAttribute("produto", produto);
			
			return "admin/produto/VisualizarProduto";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/excluir_produto")
	public ModelAndView excluirProduto(@RequestParam int id) throws IOException {
		produtoService.excluirProduto(id);
		return new ModelAndView("redirect:/listar_produtos");
	}
	
	@RequestMapping("/editar_produto")
	public String editarProduto(@Valid Produto produto, Model model, @RequestParam("file") MultipartFile file) {
		try {
			produtoService.editarProduto(produto);
			produtoService.gravarImagem(servletContext, produto, file);
			return "redirect:/listar_produtos";
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/editar_produto_pesquisa")
	public String editrProdutoPesquisa(@RequestParam int id, @Valid Produto produto, BindingResult result, Model model) {
		try {
			// TODO Código para carregar os chamados
			produto = produtoService.carregarProduto(id);
			model.addAttribute("produto", produto);
			
			return "admin/produto/EditarProduto";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	
	
	/* USUARIO */
	@RequestMapping("/cadastrar_usuario")
	public String cadastrarUsuario() {
		return "admin/usuario/CadastrarUsuario";
	}
	
	@RequestMapping("/novo_usuario")
	public String novoUsuario(@Valid Usuario usuario, BindingResult result, Model model) {
		try {
			usuarioService.novoUsuario(usuario);
			return "redirect:/listar_usuarios";
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/listar_usuarios")
	public String listarUsuarios(Model model) {
		try {
			// TODO Código para carregar os chamados
			List<Usuario> usuarios = usuarioService.listarUsuarios();
			model.addAttribute("usuarios", usuarios);
			
			return "admin/usuario/ListarUsuarios";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}

	@RequestMapping("/visualizar_usuario")
	public String visualizarUsuario(@RequestParam int id, @Valid Usuario usuario, BindingResult result, Model model) {
		try {
			// TODO Código para carregar os chamados
			usuario = usuarioService.carregarUsuario(id);
			model.addAttribute("usuario", usuario);
			
			return "admin/usuario/VisualizarUsuario";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/excluir_usuario")
	public ModelAndView excluirUsuario(@RequestParam int id) throws IOException {
		usuarioService.excluirUsuario(id);
		return new ModelAndView("redirect:/listar_usuarios");
	}
	
	@RequestMapping("/editar_usuario")
	public String editarUsuario(@Valid Usuario usuario, Model model) {
		try {
			usuarioService.editarUsuario(usuario);
			return "redirect:/listar_usuarios";
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/editar_usuario_pesquisa")
	public String editrUsuarioPesquisa(@RequestParam int id, @Valid Usuario usuario, BindingResult result, Model model) {
		try {
			// TODO Código para carregar os chamados
			usuario = usuarioService.carregarUsuario(id);
			model.addAttribute("usuario", usuario);
			
			return "admin/usuario/EditarUsuario";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/login_usuario")
	public String envia(Usuario usuario) throws IOException {
		Usuario resposta = usuarioService.loginUsuario(usuario);
		if (resposta == null) {
	    	return "Erro";
	    } else {
	    	return "redirect:/admin_index";
	    }   
	}
	
	
	
	/* CARRINHO */	
	@RequestMapping("/inserir_produto_carrinho")
	public String inserirProdutoCarrinho(@Valid Carrinho carrinho, BindingResult result, Model model) {
		try {
			carrinhoService.inserirProdutoCarrinho(carrinho);
			return "redirect:/index";
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/excluir_produto_carrinho")
	public ModelAndView excluirProdutoCarrinho(@RequestParam int id) throws IOException {
		carrinhoService.excluirProdutoCarrinho(id);
		return new ModelAndView("redirect:/index");
	}
	
	
	
	
	/* CONSUMIDOR */ 
	@RequestMapping("tela_login_consumidor")
	public String telaLoginConsumidor() {
		return "loginConsumidor";
	}
	
	@RequestMapping("consumidor_index")
	public String ConsumidorIndex(Model model) throws IOException {
		List<Produto> produtos = produtoService.listarProdutos();
		List<Produto> produtosDecrescente = produtoService.listarProdutosDecrescente();
		List<Carrinho> produtosCarrinho = carrinhoService.listarProdutoCarrinho();
		model.addAttribute("produtos", produtos);
		model.addAttribute("produtosDecrescente", produtosDecrescente);
		model.addAttribute("produtosCarrinho", produtosCarrinho);
		return "consumidor/index";
	}
	
	@RequestMapping("cadastrar_consumidor")
	public String cadastrarConsumidor() {
		return "consumidor/CadastrarConsumidor";
	}
	
	@RequestMapping("/novo_consumidor")
	public String novoConsumidor(@Valid Consumidor consumidor, Model model) {
		try {
			consumidorService.novoConsumidor(consumidor);
			return "redirect:/index";
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/listar_consumidores")
	public String listarConsumidores(Model model) {
		try {
			// TODO Código para carregar os chamados
			List<Consumidor> consumidores = consumidorService.listarConsumidores();
			model.addAttribute("consumidores", consumidores);
			
			return "admin/consumidor/ListarConsumidores";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}

	@RequestMapping("/visualizar_consumidor")
	public String visualizarConsumidor(@RequestParam int id, @Valid Consumidor consumidor, BindingResult result, Model model) {
		try {
			// TODO Código para carregar os chamados
			consumidor = consumidorService.carregarConsumidor(id);
			model.addAttribute("consumidor", consumidor);
			
			return "admin/consumidor/VisualizarConsumidor";

		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
	}
	
	@RequestMapping("/login_consumidor")
	public String logarConsumidor(Consumidor consumidor) throws IOException {
		Consumidor resposta = consumidorService.loginConsumidor(consumidor);
		if (resposta == null) {
	    	return "Erro";
	    } else {
	    	return "redirect:/consumidor_index";
	    }   
	}
	
}
