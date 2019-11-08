package br.usjt.arqsw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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

import br.usjt.arqsw.entity.Produto;
import br.usjt.arqsw.entity.Usuario;
import br.usjt.arqsw.service.ProdutoService;
import br.usjt.arqsw.service.UsuarioService;

@Transactional
@Controller
public class ManterController {
	ProdutoService produtoService;
	UsuarioService usuarioService;
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	public ManterController(ProdutoService ps, UsuarioService us) {
		produtoService = ps;
		usuarioService = us;
	}

	@RequestMapping("index")
	public String inicio(@Valid Produto produto, BindingResult result, Model model) throws IOException {
		List<Produto> produtos = produtoService.listarProdutos(produto);
		List<Produto> produtosDecrescente = produtoService.listarProdutosDecrescente(produto);
		model.addAttribute("produtos", produtos);
		model.addAttribute("produtosDecrescente", produtosDecrescente);
		return "index";
	}
	
	
	
	/* LOGIN */
	@RequestMapping("/login")
	public String login( ) {
		return "login";
	}
	
	@RequestMapping("/loginAdmin")
	public String telaLoginAdmin(HttpSession session) {
		Usuario usuario = (Usuario)session.getAttribute("adminLogado") ;
		if (usuario != null) {
			return "redirect:/admin_index";
		}
		return "loginAdmin";
	}
	
	private Usuario carregarAdmin(String login, String senha) throws IOException{
		return usuarioService.carregarAdmin(login, senha);
	}
	
	@RequestMapping("/validar_login")
	public String validarLoginAdmin(@RequestParam String login, @RequestParam String senha, Model model, HttpSession session) {
		try {
			System.out.println("User: " + login + " Senha: " + senha);
			session.setAttribute("adminLogado", carregarAdmin(login, senha));
		} catch (IOException e) {
			e.printStackTrace();
			return "Erro";
		}
		return "redirect:/admin_index";
	}
	
	@RequestMapping("/admin_logoff")
	public String adminLogoffSession(HttpSession session) {
		session.removeAttribute("adminLogado");
		return "redirect:/index";
	}
	
	
	
	/* ADMIN */
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
	public String listarProdutos(@Valid Produto produto, BindingResult result, Model model) {
		try {
			// TODO Código para carregar os chamados
			List<Produto> produtos = produtoService.listarProdutos(produto);
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
	public String listarUsuarios(@Valid Usuario usuario, BindingResult result, Model model) {
		try {
			// TODO Código para carregar os chamados
			List<Usuario> usuarios = usuarioService.listarUsuarios(usuario);
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

}
