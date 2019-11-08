package br.usjt.arqsw.controller;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import br.usjt.arqsw.entity.Usuario;
import br.usjt.arqsw.service.UsuarioService;

@Transactional
@Controller
public class LoginController {
	private final UsuarioService us;
	
	@Autowired
	public LoginController(UsuarioService us){
		this.us = us;
	}

	@RequestMapping("loginForm")
	public String loginForm(){
		return "login";
	}
	
//	@RequestMapping("fazer_login")
//	public String efetuaLogin(Usuario usuario, HttpSession session, Model model){
//
//		try {
//			if(us.validarUsuario(usuario)){
//				session.setAttribute("usuarioLogado", usuario);
//				return "redirect:admin_index";
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//			model.addAttribute("erro", e);
//			return "erro";
//		}
//		return "redirect:loginForm";
//	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "index";
	}
}
